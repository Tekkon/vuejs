<template lang="pug">
  div.q-pa-md
    organization-form(:organization_types="organization_types" @org-form-submitted="orgFormSubmitted")
    organization-table(:organizations="organizations" :organization_types="organization_types" @org-delete-row="orgDeleteRow")
</template>

<script>
  import OrganizationForm from 'staff_components/dashboard/organizationForm.vue'
  import OrganizationTable from 'staff_components/dashboard/organizationTable.vue'

  export default {
    props: ['clients', 'organizations', 'organization_types'],
    data() {
      return {
        selected: [],
        client: {
          name: '',
          phone: '',
          email: '',
          password: ''
        },
        organization: {
          title: '',
          organization_type_id: '',
          organization_type: '',
          inn: '',
          ogrn: ''
        },
        name_validation_error: '',
        email_validation_error: '',
        phone_validation_error: '',
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'title', align: 'left', label: 'Название', field: 'title', sortable: true },
          { name: 'organization_type', label: 'Тип', field: 'organization_type_id', sortable: true },
          { name: 'inn', label: 'ИНН', field: 'inn', sortable: true },
          { name: 'ogrn', label: 'ОГРН', field: 'ogrn', sortable: true }
        ]
      }
    },
    computed: {
      isClientFormComplete () {
        return this.name_validation_error === '' && this.email_validation_error === '' && this.phone_validation_error === ''
          && this.client.name && this.client.phone && this.client.email && this.client.password
      },
      isOrgFormComplete () {
        return this.organization.title && this.organization.organization_type_id && this.organization.inn && this.organization.ogrn
      }
    },
    methods: {
      validateName() {
        if (this.client.name === '') {
          this.name_validation_error = "Name must be filled out";
        } else {
          this.name_validation_error = '';
        }
      },
      validateEmail() {
        let pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!pattern.test(this.client.email)) {
          this.email_validation_error = "Email format is invalid";
        } else {
          this.email_validation_error = '';
        }
      },
      validatePhone() {
        let pattern = /^\d+$/;
        if (!pattern.test(this.client.phone)) {
          this.phone_validation_error = "Phone should contain numbers only";
        } else {
          this.phone_validation_error = '';
        }
      },
      optionSelected(data) {
        this.organization.organization_type_id = data.value;
      },
      onRowDelete() {
        this.$emit('org-delete-row', this.selected);
        this.selected = [];
      },
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
