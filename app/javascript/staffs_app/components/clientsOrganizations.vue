<template lang="pug">
  div
    organizations-dashboard(:organizations="organizations" :organization_types="organization_types"
      @org-form-submitted="createOrganization" @org-delete-row="deleteOrganization")
    clients-organizations-dashboard(
      :clients="clients",
      :organizations="organizations",
      :clients_organizations="clients_organizations"
    )
</template>

<script>
  import OrganizationsDashboard from 'staff_components/organizations/dashboard.vue'
  import ClientsOrganizationsDashboard from 'staff_components/clients_organizations/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        organizations: [],
        organization_types: [],
        clients: [],
        clients_organizations: []
      }
    },
    created() {
      this.getOrganizationTypes();
      this.getOrganizations();
    },
    methods: {
      getOrganizations() {
        this.$api.organizations.index()
          .then((response) => this.organizations = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createOrganization(data) {
        this.$api.organizations.create(data)
          .then((response) => this.organizations.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      deleteOrganization(data) {
        this.$api.organizations.delete(data[0])
          .then((response) => {
            let index = this.organizations.map(x => { return x.id; }).indexOf(data[0].id);
            this.organizations.splice(index, 1);
          })
          .catch((err) => { this.error = true; alert(err.message); })
          .finally(() => this.loading = false)
      },
      getOrganizationTypes() {
        this.$api.organization_types.index()
          .then((response) => this.organization_types = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      getClientsOrganizations() {
        this.$api.clients_organizations.index()
          .then((response) => this.clients_organizations = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      OrganizationsDashboard,
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
