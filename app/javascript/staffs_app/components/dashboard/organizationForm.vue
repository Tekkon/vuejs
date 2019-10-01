<template lang="pug">
  div(class="q-pa-md")
    q-form(name="organization_form" class="q-gutter-md")
      q-input(filled v-model="organization.title" label="Название организации *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-select(v-model="organization.organization_type" :options="organization_types.map(orgType => ({ label: orgType.title, value: orgType.id }))"
        label="Тип организации *" :rules="[ val => val['label'] && val['label'].length > 0 || 'Поле не должно быть пустым']" @input="val => { optionSelected(val) }")

      q-input(filled v-model="organization.inn" label="ИНН *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-input(filled v-model="organization.ogrn" label="ОГРН *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-btn(label="Добавить организацию" type="button" color="primary" @click="$emit('org-form-submitted', organization)" :disabled='!isOrgFormComplete')
</template>

<script>
  export default {
    props: ['organization_types'],
    data() {
      return {
        organization: {
          title: '',
          organization_type_id: '',
          organization_type: '',
          inn: '',
          ogrn: ''
        }
      }
    },
    computed: {
      isOrgFormComplete () {
        return this.organization.title && this.organization.organization_type_id && this.organization.inn && this.organization.ogrn
      }
    },
    methods: {
      optionSelected({ value }) {
        this.organization.organization_type_id = value;
      }
    }
  }
</script>
