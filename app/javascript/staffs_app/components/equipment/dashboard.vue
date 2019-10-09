<template lang="pug">
  div.q-pa-md
    equipment-form(:organizations="organizations" @form-submitted="onFormSubmitted")
    equipment-table(:organizations="organizations" :equipment="equipment" @row-deleted="onRowDeleted")
</template>

<script>
  import EquipmentForm from 'staff_components/equipment/form.vue'
  import EquipmentTable from 'staff_components/equipment/table.vue'

  export default {
    props: ['organizations', 'equipment'],
    data() {
      return {

      }
    },
    methods: {
      onFormSubmitted(data) {
        this.$emit('form-submitted', data);
      },
      onRowDeleted(data) {
        this.$emit('row-deleted', data);
      }
    },
    components: {
      EquipmentForm,
      EquipmentTable
    }
  }
</script>
