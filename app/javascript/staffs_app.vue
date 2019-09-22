<template lang="pug">
  q-layout(view="hHh lpR fFf")
    q-page-container
      q-page
        div(v-if="loading" class="fixed-center")
          q-spinner(color="primary" size="3em" :thickness="10" align="center")
        div(v-else)
          div(v-if="error")
            p Ошибка
          div(v-else)
            nav-bar(:email="staff.email")
            dashboard(:clients="clients" :organizations="organizations" :organization_types="organization_types" @client-form-submitted="createClient"
              @org-form-submitted="createOrganization" @org-delete-row="deleteOrganization")
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
        clients: [],
        organizations: [],
        organization_types: []
      }
    },
    created() {
      this.getCurrentStaff();
      this.getClients();
      this.getOrganizationTypes();
      this.getOrganizations();
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
        this.$api.clients.create(data)
          .then((response) => this.clients.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
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
