import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Clients from 'staff_components/clients.vue'
import Staffs from 'staff_components/staffs.vue'
import Organizations from 'staff_components/organizations.vue'
import ClientOrganizations from 'staff_components/clientOrganizations.vue'
import Equipment from 'staff_components/equipment.vue'

export default new VueRouter({
  mode: 'history',
  hashbang: false,
  routes: [
    { path: '/staffs', redirect: '/staffs/clients-view' },
    { path: '/staffs/clients-view', component: Clients },
    { path: '/staffs/staffs-view', component: Staffs },
    { path: '/staffs/organizations-view', component: Organizations },
    { path: '/staffs/client-organizations-view', component: ClientOrganizations },
    { path: '/staffs/equipment-view', component: Equipment }
  ]
})
