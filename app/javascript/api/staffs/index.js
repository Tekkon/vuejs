import axios from 'axios'

let token = document.head.querySelector('meta[name="csrf-token"]')
axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content

const adapter = axios.create({
  baseURL: '/staffs/',
  headers: {
    'Accept': 'application/json'
  }
})

const api = {
  staffs: {
    current: () => adapter.get('current'),
    signOut: () => adapter.delete('sign_out')
  },
  clients: {
    index: () => adapter.get('clients'),
    create: (data, staff) => adapter.post('clients', data)
  }
}

export {
  api
}
