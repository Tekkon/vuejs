<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(:title="title" :data="users" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="delete" @click="onRowDelete")
</template>

<script>
  export default {
    props: ['users', 'title'],
    data() {
      return {
        selected: [],
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'name', align: 'left', label: 'Имя', field: 'name', sortable: true },
          { name: 'email', align: 'left', label: 'Email', field: 'email', sortable: true },
          { name: 'phone', label: 'Номер телефона', field: 'phone', sortable: true }
        ]
      }
    },
    methods: {
      onRowDelete() {
        this.$emit('user-delete-row', this.selected);
        this.selected = [];
      }
    }
  }
</script>
