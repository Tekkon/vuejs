<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(title="Организации" :data="computed_organizations" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="Delete" @click="onRowDelete" class="table-button")
</template>

<script>
  export default {
    props: ['organizations', 'organization_types'],
    data() {
      return {
        selected: [],
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'title', align: 'left', label: 'Название', field: 'title', sortable: true },
          { name: 'organization_type', label: 'Тип', field: 'organization_type', sortable: true },
          { name: 'inn', label: 'ИНН', field: 'inn', sortable: true },
          { name: 'ogrn', label: 'ОГРН', field: 'ogrn', sortable: true }
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
      computed_organizations() {
        return this.organizations.map(x => {
          return {
            id: x.id,
            title: x.title,
            organization_type: this.organization_types[this.organization_types.map(x => { return x.id; }).indexOf(x.organization_type_id)].title,
            inn: x.inn,
            ogrn: x.ogrn
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