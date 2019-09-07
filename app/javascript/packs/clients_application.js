import Vue from 'vue'
import App from '../clients_app.vue'

document.addEventListener('DOMContentLoaded', () => {
    const el = document.body.appendChild(document.createElement('application'))
    const app = new Vue({
        el,
        render: h => h(App)
    })

    console.log(app)
})