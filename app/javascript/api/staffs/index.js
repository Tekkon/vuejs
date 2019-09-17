import axios from 'axios'

export default {
  getCurrentStaff() {
    return axios.get('/staffs/current');
  },
  getClients() {
    return axios.get('/staffs/clients');
  },
  createClient(data, staff) {
    axios.defaults.headers.common['HTTP_AUTHORIZATION'] = staff.api_token
    return axios.post('/staffs/clients', data)
  }
}
