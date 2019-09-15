import axios from 'axios'

export default {
  getCurrentClient() {
    return axios.get('/clients/current');
  },
  getCurrentStaff() {
    return axios.get('/staffs/current');
  }
}
