<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(title="Клиенты и организации" :data="computed_client_organizations" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="Delete" @click="onRowDeleted" class="table-button")
</template>

<script>
  export default {
    props: ['clients', 'organizations', 'client_organizations'],
    data() {
      return {
        selected: [],
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'client', label: 'Клиент', align: 'left', field: 'client', sortable: true },
          { name: 'organization', align: 'left', label: 'Организация', field: 'organization', sortable: true }
        ]
      }
    },
    methods: {
      onRowDeleted() {
        this.$emit('row-deleted', this.selected);
        this.selected = [];
      }
    },
    computed: {
      computed_client_organizations() {
        if (this.clients && this.organizations && this.client_organizations
            && this.clients.length > 0 && this.organizations.length > 0 && this.client_organizations.length > 0) {
          return this.client_organizations.map(x => {
            return {
              id: x.id,
              client: this.clients[this.clients.map(c => {
                return c.id;
              }).indexOf(x.client_id)].name,
              organization: this.organizations[this.organizations.map(c => {
                return c.id;
              }).indexOf(x.organization_id)].title,
            }
          })
        } else {
          return [];
        }
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