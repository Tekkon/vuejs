<template lang="pug">
  q-input(
    label="Поиск"
    v-model="filter"
    debounce="500")
</template>

<script>
  export default {
    computed: {
      filter: {
        get() {
          return this.$store.state.organizations.filter
        },
        set(value) {
          this.$store.commit('updateOrganizationsFilter', value)
        }
      }
    }
  }
</script>

<style lang="scss">

</style>