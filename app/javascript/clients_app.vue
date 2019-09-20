<template lang="pug">
  div(v-if="loading")
    p Загрузка...
  div(v-else)
    div(v-if="error")
      p Ошибка
    div(v-else)
      nav-bar(:email="client.email")
</template>

<script>
  import NavBar from 'clients_app/components/navbar.vue'
  import { api } from 'api/clients'

  export default {
    data () {
      return {
        loading: true,
        error: false,
        client: {},
        title: ''
      }
    },
    created() {
      this.getCurrentClient();
    },
    methods: {
      getCurrentClient() {
        api.clients.current()
          .then((response) => this.client = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      NavBar
    }
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
