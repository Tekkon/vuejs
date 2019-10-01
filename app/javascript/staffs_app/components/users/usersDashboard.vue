<template lang="pug">
  div.q-pa-md
    users-form(:users="users" @user-form-submitted="userFormSubmitted")
    users-table(:users="users" :title="title" @user-delete-row="userDeleteRow")
</template>

<script>
  import UsersForm from 'staff_components/users/usersForm.vue'
  import UsersTable from 'staff_components/users/usersTable.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    props: ['users', 'title'],
    data() {
    },
    methods: {
      userFormSubmitted(data) {
        this.$emit('user-form-submitted', data);
      },
      userDeleteRow(data) {
        this.$emit('user-delete-row', data);
      }
    },
    components: {
      UsersForm,
      UsersTable
    },
    mixins: [loadingMixin]
  }
</script>
