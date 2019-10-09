<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(title="Оборудование" :data="computed_equipment" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="Delete" @click="onRowDeleted" class="table-button")
</template>

<script>
  export default {
    props: ['organizations', 'equipment'],
    data() {
      return {
        selected: [],
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'name', align: 'left', label: 'Название', field: 'name', sortable: true },
          { name: 'type_name', align: 'left', label: 'Тип', field: 'type_name', sortable: true },
          { name: 'serial_number', align: 'left', label: 'Серийный номер', field: 'serial_number', sortable: true },
          { name: 'organization', label: 'Тип', field: 'organization', sortable: true }
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
      computed_equipment() {
        if (this.organizations && this.equipment && this.organizations.length > 0 && this.equipment.length > 0) {
          return this.equipment.map(x => {
            return {
              id: x.id,
              name: x.name,
              type: x.type_name,
              serial_number: x.serial_number,
              organization: this.organizations[this.organizations.map(x => {
                return x.id;
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