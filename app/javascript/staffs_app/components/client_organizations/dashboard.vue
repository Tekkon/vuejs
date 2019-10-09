<template lang="pug">
  div.q-pa-md
    client-organizations-form(
      :clients="clients"
      :organizations="organizations"
      :client_organizations="client_organizations"
      @form-submitted="onFormSubmitted")

    client-organizations-table(
      :clients="clients"
      :organizations="organizations"
      :client_organizations="client_organizations"
      @row-deleted="onRowDeleted")
</template>

<script>
  import ClientOrganizationsForm from 'staff_components/client_organizations/form.vue'
  import ClientOrganizationsTable from 'staff_components/client_organizations/table.vue'

  export default {
    props: ['clients', 'organizations', 'client_organizations'],
    data() {
      return {

      }
    },
    methods: {
      onRowDeleted(data) {
        this.$emit('row-deleted', data);
      },
      onFormSubmitted(data) {
        this.$emit('form-submitted', data);
      }
    },
    components: {
      ClientOrganizationsForm,
      ClientOrganizationsTable
    }
  }
</script>
