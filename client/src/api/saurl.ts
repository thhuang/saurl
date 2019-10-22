import axios from 'axios';
import Cookies from 'js-cookie';

axios.defaults.xsrfCookieName = 'csrftoken'
axios.defaults.xsrfHeaderName = 'X-CSRFToken'

const csrftoken: string | undefined = Cookies.get('csrftoken');

export default axios.create({
  baseURL: '/api',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRFToken': csrftoken,
    'Authorization': `Token ${process.env.REACT_APP_API_TOKEN}`,
  },
});