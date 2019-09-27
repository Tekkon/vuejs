<template lang="pug">
  clients-dashboard(:clients="clients" @client-form-submitted="createClient")
</template>

<script>
  import ClientsDashboard from 'staff_components/clients/clientsDashboard.vue'

  export default {
    data () {
      return {
        loading: true,
        error: false,
        clients: []
      }
    },
    created() {
      this.getClients();
    },
    methods: {
      getClients() {
        this.$api.clients.index()
          .then((response) => this.clients = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createClient(data) {
        this.$api.clients.create(data)
          .then((response) => this.clients.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      ClientsDashboard
    }
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
