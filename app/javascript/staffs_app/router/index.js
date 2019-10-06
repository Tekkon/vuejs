import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Clients from 'staff_components/clients.vue'
import Staffs from 'staff_components/staffs.vue'
import Organizations from 'staff_components/organizations.vue'

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/staffs', redirect: '/staffs/organizations-view' },
    { path: '/staffs/clients-view', component: Clients },
    { path: '/staffs/staffs-view', component: Staffs },
    { path: '/staffs/organizations-view', component: Organizations }
  ]
})