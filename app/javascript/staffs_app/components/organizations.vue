<template lang="pug">
  organizations-dashboard(:organizations="organizations" :organization_types="organization_types"
    @org-form-submitted="createOrganization" @org-delete-row="deleteOrganization" ref="dashboard")
</template>

<script>
  import OrganizationsDashboard from 'staff_components/organizations/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        organizations: [],
        organization_types: []
      }
    },
    created() {
      this.getOrganizationTypes();
      this.getOrganizations();
    },
    computed: {
      organizationFilter() {
        return this.$store.state.organizations.filter
      }
    },
    watch: {
      organizationFilter() {
        this.getOrganizations()
      }
    },
    methods: {
      getOrganizations() {
        this.$api.organizations.index(this.organizationFilter)
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
      }
    },
    components: {
      OrganizationsDashboard
    },
    mixins: [loadingMixin],
    subscriptions: {
      OrganizationsChannel: {
        received(data) {
          console.log(data)
          this.getOrganizations()
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
