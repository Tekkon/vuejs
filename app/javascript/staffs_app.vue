<template lang="pug">
  div(v-if="loading")
    p Загрузка...
  div(v-else)
    div(v-if="error")
      p Ошибка
    div(v-else)
      nav-bar(:email="staff.email" @sign-out="signOut")
      dashboard(:clients="clients" @form-submitted="createClient")
</template>

<script>
  import NavBar from 'staff_components/navbar.vue'
  import Dashboard from 'staff_components/dashboard.vue'

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
      this.getClients();
    },
    methods: {
      getCurrentStaff() {
        this.$api.staffs.current()
          .then((response) => this.staff = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      getClients() {
        this.$api.clients.index()
          .then((response) => this.clients = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createClient(data) {
        this.$api.clients.create(data, this.staff)
          .then((response) => this.clients.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      signOut() {
        this.$api.signOut()
          .then()
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

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
