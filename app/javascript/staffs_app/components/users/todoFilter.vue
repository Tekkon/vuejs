<template lang="pug">
  q-input(
    label="Поиск"
    v-model="filter"
    debounce="300")
</template>

<script>
  export default {
    computed: {
      filter: {
        get() {
          return this.$store.state.clients.filter
        },
        set(value) {
          this.$store.commit('updateFilter', value)
        }
      }
    }
  }
</script>

<style lang="scss">

</style>