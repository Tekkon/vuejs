<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(title="Клиенты организаций" :data="computed_clients_organizations" :columns="columns" row-key="client_id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="delete" @click="onRowDelete" class="table-button")
</template>

<script>
  export default {
    props: ['clients', 'organizations', 'clients_organizations'],
    data() {
      return {
        selected: [],
        columns: [
          { name: 'client_id', required: true, label: 'ID клиента', align: 'left', field: row => row.client_id, sortable: true },
          { name: 'client', label: 'Клинет', align: 'left', field: 'client', sortable: true },
          { name: 'organization_id', align: 'left', label: 'ID организации', field: 'organization_id', sortable: true }
          { name: 'organization', align: 'left', label: 'Организация', field: 'organization', sortable: true }
        ]
      }
    },
    methods: {
      onRowDelete() {
        this.$emit('org-delete-row', this.selected);
        this.selected = [];
      }
    },
    computed: {
      computed_clients_organizations() {
        return this.clients_organizations.map(x => {
          return {
            client_id: x.client_id,
            client: this.clients[this.clients.map(x => { return x.id; }).indexOf(x.client_id)].name,
            organization_id: x.organization_id,
            organization: this.organizations[this.organizations.map(x => { return x.id; }).indexOf(x.organization_id)].title,
          }
        })
      }
    }
  }
</script>

<style lang="scss">
  .table-button {
    margin-left: 10px;
    margin-right: 10px;
  }
</style>