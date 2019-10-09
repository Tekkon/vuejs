<template lang="pug">
  .q-pa-md
    q-form(name="equipment_form" class="q-gutter-md")
      q-input(filled v-model="equipment.name" label="Название *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-input(filled v-model="equipment.type_name" label="Тип *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-input(filled v-model="equipment.serial_number" label="Серийный номер *" lazy-rules :rules="[ val => val && val.length > 0 || 'Поле не должно быть пустым']")

      q-select(v-model="equipment.organization" :options="organizations.map(org => ({ label: org.title, value: org.id }))"
               label="Организация *" :rules="[ val => val['label'] && val['label'].length > 0 || 'Поле не должно быть пустым']"
               @input="val => { optionSelected(val) }")

      q-btn(label="Добавить оборудование" type="button" color="primary" @click="$emit('form-submitted', equipment)" :disabled='!isFormComplete')
</template>

<script>
  export default {
    props: ['organizations'],
    data() {
      return {
        equipment: {
          name: '',
          type_name: '',
          serial_number: '',
          organization_id: '',
          organization: ''
        }
      }
    },
    computed: {
      isFormComplete () {
        return this.equipment.name && this.equipment.type_name && this.equipment.serial_number && this.equipment.organization_id
      }
    },
    methods: {
      optionSelected({ value }) {
        this.equipment.organization_id = value;
      }
    }
  }
</script>
