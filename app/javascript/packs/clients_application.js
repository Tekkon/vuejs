import Vue from 'vue'
import App from '../clients_app.vue'

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App)
    })
})
