<template lang="pug">
  div.q-pa-md
    clients-organizations-form(
      :clients="clients"
      :organizations="organizations"
      :clients_organizations="clients_organizations"
      @form-submitted="onFormSubmitted")

    clients-organizations-table(
      :clients="clients"
      :organizations="organizations"
      :clients_organizations="clients_organizations"
      @row-deleted="onRowDeleted")
</template>

<script>
  import ClientsOrganizationsForm from 'staff_components/clients_organizations/form.vue'
  import ClientsOrganizationsTable from 'staff_components/clients_organizations/table.vue'

  export default {
    props: ['clients', 'organizations', 'clients_organizations'],
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
      ClientsOrganizationsForm,
      ClientsOrganizationsTable
    }
  }
</script>
