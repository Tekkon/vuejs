<template lang="pug">
  clients-organizations-dashboard(
    :clients="clients",
    :organizations="organizations",
    :clients_organizations="clients_organizations"
    @form-submitted="createClientOrganization"
    @row-deleted="deleteClientOrganization"
  )
</template>

<script>
  import ClientsOrganizationsDashboard from 'staff_components/clients_organizations/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        clients: [],
        organizations: [],
        clients_organizations: []
      }
    },
    created() {
      this.getClients();
      this.getOrganizations();
      this.getClientsOrganizations();
    },
    methods: {
      getClients() {
        this.$api.clients.index()
          .then((response) => this.clients = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      getOrganizations() {
        this.$api.organizations.index()
          .then((response) => this.organizations = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      getClientsOrganizations() {
        this.$api.clients_organizations.index()
          .then((response) => this.clients_organizations = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createClientOrganization(data) {
        this.$api.clients_organizations.create(data)
          .then((response) => this.clients_organizations.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      deleteClientOrganization(data) {
        this.$api.clients_organizations.delete(data[0])
          .then((response) => {
            let index = this.clients_organizations.map(x => { return x.id; }).indexOf(data[0].id);
            this.clients_organizations.splice(index, 1);
          })
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      ClientsOrganizationsDashboard
    },
    mixins: [loadingMixin]
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
