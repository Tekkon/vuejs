import Vue from 'vue'
import App from '../staffs_app.vue'
import { api } from 'api/staffs'

Vue.prototype.$api = api

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App)
    })
})
