<template lang="pug">
  q-dialog(v-model="show_user_edit" @hide="onDialogHide")
    q-card
      q-card-section
        .text-h6 {{ title }}

      q-card-section
        edit-form(:user="user" @user-edit-form-submitted="onUserEditFormSubmitted")

      q-card-actions(align="right")
</template>

<script>
  import EditForm from 'staff_components/users/editForm.vue'

  export default {
    props: ['show_user_edit', 'user', 'title'],
    data() {
      return {
      }
    },
    components: {
      EditForm
    },
    methods: {
      onUserEditFormSubmitted(data) {
        this.$emit('user-edit-form-submitted', data)
      },
      onDialogHide() {
        this.$emit('edit-dialog-hide')
      }
    }
  }
</script>
