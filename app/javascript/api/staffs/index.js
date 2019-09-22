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
    current: () => adapter.get('current')
  },
  clients: {
    index: () => adapter.get('clients'),
    create: (data) => adapter.post('clients', data)
  },
  organizations: {
    index: () => adapter.get('organizations'),
    create: (data) => adapter.post('organizations', data),
    delete: (data) => adapter.delete('organizations/' + data.id)
  },
  organization_types: {
    index: () => adapter.get('organization_types')
  }
}

export {
  api
}
