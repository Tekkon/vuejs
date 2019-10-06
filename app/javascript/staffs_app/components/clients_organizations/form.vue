<template lang="pug">
  .q-pa-md
    q-form(name="clients_organizations_form" class="q-gutter-md")
      q-select(
        v-model="client_organization.client"
        :options="clients.map(client => ({ label: client.name, value: client.id }))"
        label="Клиент *"
        :rules="[ val => val['label'] && val['label'].length > 0 || 'Поле не должно быть пустым']"
        @input="val => { clientSelected(val) }")

      q-select(
        v-model="client_organization.organization"
        :options="organizations.map(org => ({ label: org.title, value: org.id }))"
        label="Организация *"
        :rules="[ val => val['label'] && val['label'].length > 0 || 'Поле не должно быть пустым']"
        @input="val => { organizationSelected(val) }")

      q-btn(label="Добавить" type="button" color="primary" @click="$emit('form-submitted', client_organization)" :disabled='!isFormComplete')
</template>

<script>
  export default {
    props: ['clients', 'organizations', 'clients_organizations'],
    data() {
      return {
        client_organization: {
          client_id: '',
          organization_id: '',
          client: '',
          organization: ''
        }
      }
    },
    computed: {
      isFormComplete () {
        return this.client_organization.client_id && this.client_organization.organization_id
      }
    },
    methods: {
      clientSelected({ value }) {
        this.client_organization.client_id = value;
      },
      organizationSelected({ value }) {
        this.client_organization.organization_id = value;
      }
    }
  }
</script>
