import axios from 'axios';

export default axios.create({
  baseURL: '/api',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Token ${process.env.REACT_APP_API_TOKEN}`,
  },
});