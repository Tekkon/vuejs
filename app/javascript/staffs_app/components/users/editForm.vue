<template lang="pug">
  .q-pa-md
    q-form(name="users_edit_form" class="q-gutter-md")
      q-input(filled v-model="edit_user.name" label="Имя *" lazy-rules
      :rules="[ val => nameRules(val) || 'Имя не должно быть пустым']")

      q-input(filled v-model="edit_user.email" label="Email *" lazy-rules
      :rules="[ val => emailRules(val) || 'Email должен быть в формате: email@somewhere.com']")

      q-input(filled v-model="edit_user.phone" label="Номер телефона *" lazy-rules
      :rules="[ val => phoneRules(val) || 'Номер телефона должен содержать только цифры']")

      .q-gutter-sm
        q-checkbox(v-model="edit_user.reset_password" label="Изменить пароль")

      q-btn(label="OK" type="button" color="primary" @click="$emit('user-edit-form-submitted', edit_user)" :disabled="!isFormComplete")
</template>

<script>
  export default {
    props: ['user'],
    data() {
      return {
        edit_user: {
          id: this.user.id,
          name: this.user.name,
          email: this.user.email,
          phone: this.user.phone,
          reset_password: false
        },
        email_template: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
        phone_template: /^\d+$/
      }
    },
    computed: {
      isFormComplete () {
        return this.nameRules(this.edit_user.name) && this.emailRules(this.edit_user.email) && this.phoneRules(this.edit_user.phone)
          && (this.reset_password && this.passwordRules(this.edit_user.password) || !this.reset_password)
      }
    },
    methods: {
      nameRules(val) {
        return val && val.length > 0
      },
      emailRules(val) {
        return val && this.email_template.test(val)
      },
      phoneRules(val) {
        return val && this.phone_template.test(val)
      },
      passwordRules(val) {
        return val && val.length >= 8
      }
    }
  }
</script>
