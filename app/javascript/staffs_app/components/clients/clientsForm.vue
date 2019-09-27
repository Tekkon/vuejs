<template lang="pug">
  .q-pa-md
    q-form(name="clients_form" class="q-gutter-md")
      q-input(filled v-model="client.name" label="Имя *" lazy-rules
        :rules="[ val => val && val.length > 0 || 'Имя не должно быть пустым']")

      q-input(filled v-model="client.email" label="Email *" lazy-rules
        :rules="[ val => val && /^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/.test(val) || 'Email должен быть в формате: email@somewhere.com']")

      q-input(filled v-model="client.phone" label="Номер телефона *" lazy-rules
        :rules="[ val => val && /^\\d+$/.test(val) || 'Номер телефона должен содержать только цифры']")

      q-input(filled v-model="client.password" label="Пароль *" lazy-rules
        :rules="[ val => val && val.length >= 8 || 'Пароль не должен быть короче 8 символов']")

      q-btn(label="Добавить клиента" type="button" color="primary" @click="$emit('client-form-submitted', organization)" :disabled='!isClientFormComplete')
</template>

<script>
  export default {
    props: ['clients'],
    data() {
      return {
        client: {
          name: '',
          phone: '',
          email: '',
          password: ''
        }
      }
    },
    computed: {
      isClientFormComplete () {
        return this.name_validation_error === '' && this.email_validation_error === '' && this.phone_validation_error === ''
          && this.client.name && this.client.phone && this.client.email && this.client.password
      }
    },
    methods: {
      validateName() {
        if (this.client.name === '') {
          this.name_validation_error = "Name must be filled out";
        } else {
          this.name_validation_error = '';
        }
      },
      validateEmail() {
        let pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!pattern.test(this.client.email)) {
          this.email_validation_error = "Email format is invalid";
        } else {
          this.email_validation_error = '';
        }
      },
      validatePhone() {
        let pattern = /^\d+$/;
        if (!pattern.test(this.client.phone)) {
          this.phone_validation_error = "Phone should contain numbers only";
        } else {
          this.phone_validation_error = '';
        }
      }
    }
  }
</script>
