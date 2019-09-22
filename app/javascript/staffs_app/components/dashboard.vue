<template lang="pug">
  div(class="q-pa-md")
    //p Клиенты:
    //div(v-for="client in clients" v-bind:key="client.id")
    //  p {{ client.name }}, {{ client.email }}, {{ client.phone }}

    //form(name="client_form")
    //  .row
    //    label(for="name_input") Имя:
    //    input(id="name_input" name="name" type="text" v-model="client.name" @keyup="validateName" required)
    //    label(style="color:red;") {{ name_validation_error }}

    //  .row
    //    label(for="name_input") Email:
    //    input(id="email_input" name="email" type="text" v-model="client.email" @keyup="validateEmail" required)
    //    label(style="color:red;") {{ email_validation_error }}

    //  .row
    //    label(for="phone_input") Телефон:
    //    input(id="phone_input" name="phone" type="text" v-model="client.phone" @keyup="validatePhone" required)
    //    label(style="color:red;") {{ phone_validation_error }}

    //  .row
    //    label(for="password_input") Пароль:
    //    input(id="password_input" name="password" type="password" v-model="client.password" required)

    //  .row
    //    input(type="button" value="Добавить клиента" :disabled='!isClientFormComplete' @click="$emit('client-form-submitted', client)")

    q-form(name="organization_form" class="q-gutter-md")
      q-input(filled v-model="organization.title" label="Название организации *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-select(v-model="organization.organization_type" :options="organization_types.map(orgType => ({ label: orgType.title, value: orgType.id }))"
        label="Тип организации *" :rules="[ val => val['label'] && val['label'].length > 0 || 'Поле не должно быть пустым']" @input="val => { optionSelected(val) }")

      q-input(filled v-model="organization.inn" label="ИНН *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-input(filled v-model="organization.ogrn" label="ОГРН *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-btn(label="Добавить организацию" type="button" color="primary" @click="$emit('org-form-submitted', organization)" :disabled='!isOrgFormComplete')

    br
    q-table(title="Организации" :data="organizations" :columns="columns" row-key="id" selection="single" :selected.sync="selected")
      template(slot="top-selection" slot-scope="props")
        q-btn(color="negative" flat round delete icon="delete" @click="onRowDelete")
</template>

<script>
  export default {
    props: ['clients', 'organizations', 'organization_types'],
    data() {
      return {
        selected: [],
        client: {
          name: '',
          phone: '',
          email: '',
          password: ''
        },
        organization: {
          title: '',
          organization_type_id: '',
          organization_type: '',
          inn: '',
          ogrn: ''
        },
        name_validation_error: '',
        email_validation_error: '',
        phone_validation_error: '',
        columns: [
          { name: 'id', required: true, label: 'ID', align: 'left', field: row => row.id, sortable: true },
          { name: 'title', align: 'left', label: 'Название', field: 'title', sortable: true },
          { name: 'organization_type', label: 'Тип', field: 'organization_type_id', sortable: true },
          { name: 'inn', label: 'ИНН', field: 'inn', sortable: true },
          { name: 'ogrn', label: 'ОГРН', field: 'ogrn', sortable: true }
        ]
      }
    },
    computed: {
      isClientFormComplete () {
        return this.name_validation_error === '' && this.email_validation_error === '' && this.phone_validation_error === ''
          && this.client.name && this.client.phone && this.client.email && this.client.password
      },
      isOrgFormComplete () {
        return this.organization.title && this.organization.organization_type_id && this.organization.inn && this.organization.ogrn
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
      },
      optionSelected(data) {
        this.organization.organization_type_id = data.value;
      },
      onRowDelete() {
        this.$emit('org-delete-row', this.selected);
        this.selected = [];
      }
    }
  }
</script>
