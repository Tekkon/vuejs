<template lang="pug">
  div.q-pa-md
    organizations-form(:organization_types="organization_types" @org-form-submitted="orgFormSubmitted")
    organizations-table(:organizations="organizations" :organization_types="organization_types" @org-delete-row="orgDeleteRow")
</template>

<script>
  import OrganizationsForm from 'staff_components/organizations/form.vue'
  import OrganizationsTable from 'staff_components/organizations/table.vue'

  export default {
    props: ['organizations', 'organization_types'],
    data() {
      return {

      }
    },
    methods: {
      orgFormSubmitted(data) {
        this.$emit('org-form-submitted', data);
      },
      orgDeleteRow(data) {
        this.$emit('org-delete-row', data);
      }
    },
    components: {
      OrganizationsForm,
      OrganizationsTable
    }
  }
</script>
