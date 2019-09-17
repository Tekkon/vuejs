<template>
    <div v-if="loading">
        <p>Загрузка...</p>
    </div>
    <div v-else>
        <div v-if="error">
          <p>Ошибка</p>
        </div>
        <div v-else>
          <nav-bar :email="staff.email"></nav-bar>
          <dashboard :clients="clients"></dashboard>
        </div>
    </div>
</template>

<script>
    import NavBar from 'staffs_app/components/navbar.vue'
    import Dashboard from 'staffs_app/components/dashboard.vue'
    import api from 'api/staffs'

    export default {
        data () {
            return {
                loading: true,
                error: false,
                staff: {},
                title: '',
                clients: []
            }
        },
        created() {
            this.getCurrentStaff();
        },
        methods: {
            getCurrentStaff() {
              api.getCurrentStaff()
                .then((response) => this.staff = response.data)
                .catch(() => this.error = true)
                .finally(() => this.loading = false)
            },
            getClients() {
              api.getClients()
                .then((response) => this.clients = response.data)
                .catch(() => this.error = true)
                .finally(() => this.loading = false)
            }
        },
        components: {
            NavBar,
            Dashboard
        }
    }
</script>

<style scoped>
    p {
        font-size: 1em;
    }
</style>
