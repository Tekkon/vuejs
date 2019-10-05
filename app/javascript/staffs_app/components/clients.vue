<template lang="pug">
  users-dashboard(:users="clients" title="Клиенты" @user-form-submitted="createClient" @user-delete-row="deleteClient")
</template>

<script>
  import UsersDashboard from 'staff_components/users/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
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
      },
      deleteClient(data) {
        this.$api.clients.delete(data[0])
          .then((response) => {
            let index = this.clients.map(x => { return x.id; }).indexOf(data[0].id);
            this.clients.splice(index, 1);
          })
          .catch((err) => { this.error = true; alert(err.message); })
          .finally(() => this.loading = false)
      }
    },
    components: {
      UsersDashboard
    },
    mixins: [loadingMixin]
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
