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
    index: (data) => adapter.get(`organizations?filter=${data !== undefined ? data : ''}`),
    create: (data) => adapter.post('organizations', data),
    delete: (data) => adapter.delete(`organizations/${data.id}`)
  },
  equipment: {
    index: () => adapter.get('equipment'),
    create: (data) => adapter.post('equipment', data),
    delete: (data) => adapter.delete(`equipment/${data.id}`)
  },
  organization_types: {
    index: () => adapter.get('organization_types')
  },
  client_organizations: {
    index: () => adapter.get('client_organizations'),
    create: (data) => adapter.post('client_organizations', data),
    delete: (data) => adapter.delete(`client_organizations/${data.id}`, data)
  }
}

export {
  api
}
