import Vue from 'vue'
import App from '../staffs_app.vue'
import { api } from 'api/staffs'
import '../stylus/quasar'

import router from '../staffs_app/router'

Vue.prototype.$api = api

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App),
        router
    })
})
