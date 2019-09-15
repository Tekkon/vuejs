import axios from 'axios'

export default {
  getList() {
    return axios.get('/clients/list');
  }
}
