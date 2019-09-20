import axios from 'axios'

let token = document.head.querySelector('meta[name="csrf-token"]')
axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content

const adapter = axios.create({
  baseURL: '/clients/',
  headers: {
    'Accept': 'application/json'
  }
})

const api = {
  clients: {
    current: () => adapter.get('current')
  }
}

export {
  api
}
