<template lang="pug">
  div(class="q-pa-md")
    br
    q-table(:title="title" :data="users" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="Delete" @click="onRowDelete" class="table-button")
        q-btn(color="positive" flat round edit icon="Edit" @click="show_user_edit = true" class="table-button")
    edit-dialog(
      :show_user_edit="show_user_edit"
      :user="selected[0]"
      :title="edit_dialog_title"
      @user-edit-form-submitted="onUserEditFormSubmitted"
      @edit-dialog-hide="onEditDialogHide"
    )
</template>

<script>
  import EditDialog from 'staff_components/users/editDialog.vue'

  export default {
    props: ['users', 'title', 'edit_dialog_title'],
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
      },
      onUserEditFormSubmitted(data) {
        this.show_user_edit = false;
        this.$emit('user-edit-form-submitted', data)
      },
      onEditDialogHide() {
        this.show_user_edit = false;
      }
    },
    components: {
      EditDialog
    }
  }
</script>

<style lang="scss">
  .table-button {
    margin-left: 10px;
    margin-right: 10px;
  }
</style>
