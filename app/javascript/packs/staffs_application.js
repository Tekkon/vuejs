import Vue from 'vue/dist/vue.esm'
import App from '../staffs_app.vue'

document.addEventListener('DOMContentLoaded', () => {
    new Vue({
        el: '#app',
        render: h => h(App)
    })
})
