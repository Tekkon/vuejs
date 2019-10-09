<template lang="pug">
  client-organizations-dashboard(
    :clients="clients",
    :organizations="organizations",
    :client_organizations="client_organizations"
    @form-submitted="createClientOrganization"
    @row-deleted="deleteClientOrganization"
  )
</template>

<script>
  import ClientOrganizationsDashboard from 'staff_components/client_organizations/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        clients: [],
        organizations: [],
        client_organizations: []
      }
    },
    created() {
      this.getClients();
      this.getOrganizations();
      this.getClientOrganizations();
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
      getClientOrganizations() {
        this.$api.client_organizations.index()
          .then((response) => this.client_organizations = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createClientOrganization(data) {
        this.$api.client_organizations.create(data)
          .then((response) => this.client_organizations.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      deleteClientOrganization(data) {
        this.$api.client_organizations.delete(data[0])
          .then((response) => {
            let index = this.client_organizations.map(x => { return x.id; }).indexOf(data[0].id);
            this.client_organizations.splice(index, 1);
          })
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      ClientOrganizationsDashboard
    },
    mixins: [loadingMixin]
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
