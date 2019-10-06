<template lang="pug">
  .q-pa-md
    q-form(name="users_form" class="q-gutter-md")
      q-input(filled v-model="user.name" label="Имя *" lazy-rules
      :rules="[ val => nameRules(val) || 'Имя не должно быть пустым']")

      q-input(filled v-model="user.email" label="Email *" lazy-rules
      :rules="[ val => emailRules(val) || 'Email должен быть в формате: email@somewhere.com']")

      q-input(filled v-model="user.phone" label="Номер телефона *" lazy-rules
      :rules="[ val => phoneRules(val) || 'Номер телефона должен содержать только цифры']")

      q-btn(label="Добавить" type="button" color="primary" @click="$emit('user-form-submitted', user)" :disabled="!isFormComplete")
</template>

<script>
  export default {
    data() {
      return {
        user: {
          name: '',
          phone: '',
          email: '',
          reset_password: true
        },
        email_template: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,
        phone_template: /^\d+$/
      }
    },
    computed: {
      isFormComplete () {
        return this.nameRules(this.user.name) && this.emailRules(this.user.email) && this.phoneRules(this.user.phone)
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
      }
    }
  }
</script>
