import axios from 'axios'

let token = document.head.querySelector('meta[name="csrf-token"]')
axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content

export default {
  getCurrentStaff() {
    return axios.get('/staffs/current');
  },
  getClients() {
    return axios.get('/staffs/clients');
  },
  createClient(data, staff) {
    return axios.post('/staffs/clients', data);
  },
  signOut() {
    return axios.get('/staffs/sign_out');
  }
}
