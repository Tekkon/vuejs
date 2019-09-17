<template>
  <div v-if="loading">
    <p>Загрузка...</p>
  </div>
  <div v-else>
    <div v-if="error">
      <p>Ошибка</p>
    </div>
    <div v-else>
      <nav-bar :email="client.email"></nav-bar>
    </div>
  </div>
</template>

<script>
  import NavBar from 'clients_app/components/navbar.vue'
  import api from 'api/clients'

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
        api.getCurrentClient()
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

<style scoped>
  p {
    font-size: 1em;
  }
</style>

