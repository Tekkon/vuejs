import axios from 'axios'

export default {
  getCurrentStaff() {
    return axios.get('/staffs/current');
  },
  getClients() {
    return axios.get('/staffs/clients');
  }
}
