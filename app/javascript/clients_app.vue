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
  import NavBar from 'client_components/navbar.vue'

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
        this.$api.clients.current()
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
