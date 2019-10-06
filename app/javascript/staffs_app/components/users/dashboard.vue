<template lang="pug">
  div.q-pa-md
    users-form(@user-form-submitted="onUserFormSubmitted")
    users-table(:users="users" :title="title" :edit_dialog_title="edit_dialog_title" @user-delete-row="onUserRowDeleted" @user-edit-form-submitted="onUserEditFormSubmitted")
</template>

<script>
  import UsersForm from 'staff_components/users/form.vue'
  import UsersTable from 'staff_components/users/table.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    props: ['users', 'title', 'edit_dialog_title'],
    data() {
    },
    methods: {
      onUserFormSubmitted(data) {
        this.$emit('user-form-submitted', data);
      },
      onUserRowDeleted(data) {
        this.$emit('user-delete-row', data);
      },
      onUserEditFormSubmitted(data) {
        this.$emit('user-edit-form-submitted', data)
      }
    },
    components: {
      UsersForm,
      UsersTable
    },
    mixins: [loadingMixin]
  }
</script>
