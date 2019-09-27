<template lang="pug">
  div(class="q-pa-md")
    p Клиенты:
    div(v-for="client in clients" :key="client.id")
      p {{ client.name }}, {{ client.email }}, {{ client.phone }}

    form(name="client_form")
      .row
        label(for="name_input") Имя:
        input(id="name_input" name="name" type="text" v-model="client.name" @keyup="validateName" required)
        label(style="color:red;") {{ name_validation_error }}

      .row
        label(for="name_input") Email:
        input(id="email_input" name="email" type="text" v-model="client.email" @keyup="validateEmail" required)
        label(style="color:red;") {{ email_validation_error }}

      .row
        label(for="phone_input") Телефон:
        input(id="phone_input" name="phone" type="text" v-model="client.phone" @keyup="validatePhone" required)
        label(style="color:red;") {{ phone_validation_error }}

      .row
        label(for="password_input") Пароль:
        input(id="password_input" name="password" type="password" v-model="client.password" required)

      .row
        input(type="button" value="Добавить клиента" :disabled='!isClientFormComplete' @click="$emit('client-form-submitted', client)")
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
