<template lang="pug">
  q-layout(view="hHh lpR fFf")
    q-page-container
      q-page
        div(v-if="loading" class="fixed-center")
          q-spinner(color="primary" size="3em" :thickness="10" align="center")
        div(v-else)
          div(v-if="error")
            p Ошибка
          div(v-else)
            nav-bar(:email="staff.email")

            div
              router-link(to="/staffs/clients-view") Клиенты

            div
              router-link(to="/staffs/staffs-view") Сотрудники

            div
              router-link(to="/staffs/organizations-view") Организации

            div
              router-link(to="/staffs/client-organizations-view") Клиенты и организации

            div
              router-link(to="/staffs/equipment-view") Оборудование

            router-view
</template>

<script>
  import NavBar from 'staff_components/navbar.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        staff: {}
      }
    },
    created() {
      this.getCurrentStaff();
    },
    methods: {
      getCurrentStaff() {
        this.$api.staffs.current()
          .then((response) => this.staff = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      NavBar
    },
    mixins: [loadingMixin]
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
