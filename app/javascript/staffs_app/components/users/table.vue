<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(:title="title" :data="users" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="delete" @click="onRowDelete")
        q-btn(color="positive" flat round edit icon="edit" @click="show_user_edit = true")
    edit-dialog(:show_user_edit="show_user_edit" @popup-closed="show_user_edit = false")
</template>

<script>
  import EditDialog from 'staff_components/users/editDialog.vue'

  export default {
    props: ['users', 'title'],
    data() {
      return {
        selected: [],
        show_user_edit: false,
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
    },
    components: {
      EditDialog
    }
  }
</script>
