import Vue from 'vue'
import App from '../clients_app.vue'
import { api } from 'api/clients'
import '../stylus/quasar'

Vue.prototype.$api = api

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App)
    })
})
