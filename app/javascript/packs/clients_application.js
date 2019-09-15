import Vue from 'vue/dist/vue.esm'
import App from '../clients_app.vue'

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App)
    })
})
