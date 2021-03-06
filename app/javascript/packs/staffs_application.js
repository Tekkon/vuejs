import Vue from 'vue'
import App from '../staffs_app.vue'
import { api } from 'api/staffs'
import '../stylus/quasar'

Vue.prototype.$api = api

import router from '../staffs_app/router'
import store from '../staffs_app/store'
import '../staffs_app/sockets'

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App),
        router,
        store
    })
})
