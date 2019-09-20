<template lang="pug">
  div
    div(v-for="client in clients" v-bind:key="client.id")
      p {{ client.name }}, {{ client.email }}, {{ client.phone }}

    form(name="client_form")
      label(for="name_input") Имя:
      input(id="name_input" name="name" type="text" v-model="form.name" @keyup="validateName" required)
      label(style="color:red;") {{ name_validation_error }}
      br

      label(for="name_input") Email:
      input(id="email_input" name="email" type="text" v-model="form.email" @keyup="validateEmail" required)
      label(style="color:red;") {{ email_validation_error }}
      br

      label(for="phone_input") Телефон:
      input(id="phone_input" name="phone" type="text" v-model="form.phone" @keyup="validatePhone" required)
      label(style="color:red;") {{ phone_validation_error }}
      br

      label(for="password_input") Пароль:
      input(id="password_input" name="password" type="password" v-model="form.password" required)
      br

      input(type="button" value="Добавить клиента" @click="$emit('form-submitted', form)")
</template>

<script>
  export default {
    props: ['clients'],
    data() {
      return {
        form: {
          name: '',
          phone: '',
          email: '',
          password: ''
        },
        name_validation_error: '',
        email_validation_error: '',
        phone_validation_error: ''
      }
    },
    methods: {
      validateName() {
        if (this.form.name == '') {
          this.name_validation_error = "Name must be filled out";
        } else {
          this.name_validation_error = '';
        }
      },
      validateEmail() {
        var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!pattern.test(this.form.email)) {
          this.email_validation_error = "Email format is invalid";
        } else {
          this.email_validation_error = '';
        }
      },
      validatePhone() {
        var pattern = /^\d+$/;
        if (!pattern.test(this.form.phone)) {
          this.phone_validation_error = "Phone should contain numbers only";
        } else {
          this.phone_validation_error = '';
        }
      }
    }
  }
</script>
