<template>
  <div>
    <ul v-for="(client, index) in clients">
      <li>{{ client.name }}, {{ client.email }}, {{ client.phone }}</li>
    </ul>
    <form name="client_form" onsubmit="return validateForm()">
      <input name="name" type="text" v-model="form.name" required>
      <input name="phone" type="text" v-model="form.phone" required>
      <input name="email" type="text" v-model="form.email" required>
      <input type="submit" value="Добавить клиента">
    </form>
  </div>
</template>

<script>
  export default {
    props: ['clients'],
    data: {
      form: {
        name: '',
        phone: '',
        email: ''
      }
    },
    methods: {
      validateForm() {
        var name = document.forms["client_form"]["name"].value;
        if (name == "") {
          alert("Name must be filled out");
          return false;
        }

        var phone = document.forms["client_form"]["phone"].value;
        var pattern = /^\d+$/;
        if (!pattern.test(phone)) {
          alert("Phone must consist of numers only");
          return false;
        }

        var email = document.forms["client_form"]["email"].value;
        var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (!pattern.test(email)) {
          alert("Email is invalid");
          return false;
        }
      }
    }
  }
</script>
