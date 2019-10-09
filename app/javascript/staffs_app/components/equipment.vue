<template lang="pug">
  equipment-dashboard(:organizations="organizations" :equipment="equipment"
    @form-submitted="createEquipment" @row-deleted="deleteEquipment")
</template>

<script>
  import EquipmentDashboard from 'staff_components/equipment/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        organizations: [],
        equipment: []
      }
    },
    created() {
      this.getEquipment();
      this.getOrganizations();
    },
    methods: {
      getEquipment() {
        this.$api.equipment.index()
          .then((response) => this.equipment = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createEquipment(data) {
        this.$api.equipment.create(data)
          .then((response) => this.equipment.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      deleteEquipment(data) {
        this.$api.equipment.delete(data[0])
          .then((response) => {
            let index = this.equipment.map(x => { return x.id; }).indexOf(data[0].id);
            this.equipment.splice(index, 1);
          })
          .catch((err) => { this.error = true; alert(err.message); })
          .finally(() => this.loading = false)
      },
      getOrganizations() {
        this.$api.organizations.index()
          .then((response) => this.organizations = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      EquipmentDashboard
    },
    mixins: [loadingMixin]
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
