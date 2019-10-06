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
  clients: {
    index: () => adapter.get('clients'),
    create: (data) => adapter.post('clients', data),
    update: (data) => adapter.patch(`clients/${data.id}`, data),
    delete: (data) => adapter.delete(`clients/${data.id}`, data),
  },
  staffs: {
    current: () => adapter.get('current'),
    index: () => adapter.get('staffs'),
    create: (data) => adapter.post('staffs', data),
    update: (data) => adapter.patch(`staffs/${data.id}`, data),
    delete: (data) => adapter.delete(`staffs/${data.id}`, data),
  },
  organizations: {
    index: () => adapter.get('organizations'),
    create: (data) => adapter.post('organizations', data),
    delete: (data) => adapter.delete(`organizations/${data.id}`)
  },
  organization_types: {
    index: () => adapter.get('organization_types')
  },
  clients_organizations: {
    index: () => adapter.get('clients_organizations'),
    create: (data) => adapter.post('clients_organizations', data),
    delete: (data) => adapter.post('clients_organizations/destroy', data)
  }
}

export {
  api
}
