import axios from 'axios'

let token = document.head.querySelector('meta[name="csrf-token"]')
axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content

export default {
  getCurrentClient() {
    return axios.get('/clients/current');
  }
}
