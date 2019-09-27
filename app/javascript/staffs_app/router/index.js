import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Clients from 'staff_components/clients.vue'
import Organizations from 'staff_components/organizations.vue'

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/staffs', redirect: '/staffs/organizations-view' },
    { path: '/staffs/clients-view', component: Clients },
    { path: '/staffs/organizations-view', component: Organizations }
  ]
})