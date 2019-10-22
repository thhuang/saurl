import axios from 'axios';

console.log(process.env.REACT_APP_API_TOKEN)

export default axios.create({
  baseURL: '/api',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Token ${process.env.REACT_APP_API_TOKEN}`,
  },
});