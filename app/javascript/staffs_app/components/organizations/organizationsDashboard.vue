<template lang="pug">
  div.q-pa-md
    organization-form(:organization_types="organization_types" @org-form-submitted="orgFormSubmitted")
    organization-table(:organizations="organizations" :organization_types="organization_types" @org-delete-row="orgDeleteRow")
</template>

<script>
  import OrganizationForm from 'staff_components/organizations/organizationForm.vue'
  import OrganizationTable from 'staff_components/organizations/organizationTable.vue'

  export default {
    props: ['organizations', 'organization_types'],
    data() {
      return {
        selected: [],
        organization: {
          title: '',
          organization_type_id: '',
          organization_type: '',
          inn: '',
          ogrn: ''
        },
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'title', align: 'left', label: 'Название', field: 'title', sortable: true },
          { name: 'organization_type', label: 'Тип', field: 'organization_type_id', sortable: true },
          { name: 'inn', label: 'ИНН', field: 'inn', sortable: true },
          { name: 'ogrn', label: 'ОГРН', field: 'ogrn', sortable: true }
        ]
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
      OrganizationForm,
      OrganizationTable
    }
  }
</script>
