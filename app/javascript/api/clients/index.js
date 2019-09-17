import axios from 'axios'

export default {
  getCurrentClient() {
    return axios.get('/clients/current');
  }
}
