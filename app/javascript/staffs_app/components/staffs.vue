<template lang="pug">
  users-dashboard(
    :users="staffs"
    title="Сотрудники"
    edit_dialog_title="Редактировать сотрудника"
    @user-form-submitted="createStaff"
    @user-delete-row="deleteStaff"
    @user-edit-form-submitted="updateStaff"
  )
</template>

<script>
  import UsersDashboard from 'staff_components/users/dashboard.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    data () {
      return {
        staffs: []
      }
    },
    created() {
      this.getStaffs();
    },
    methods: {
      getStaffs() {
        this.$api.staffs.index()
          .then((response) => this.staffs = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      createStaff(data) {
        this.$api.staffs.create(data)
          .then((response) => this.staffs.push(response.data))
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      updateStaff(data) {
        this.$api.staffs.update(data)
          .then((response) => {
            let index = this.staffs.map(x => { return x.id; }).indexOf(response.data.id);
            this.staffs[index].name = response.data.name;
            this.staffs[index].email = response.data.email;
            this.staffs[index].phone = response.data.phone;
          })
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      deleteStaff(data) {
        this.$api.staffs.delete(data[0])
          .then((response) => {
            let index = this.staffs.map(x => { return x.id; }).indexOf(data[0].id);
            this.staffs.splice(index, 1);
          })
          .catch((err) => { this.error = true; alert(err.message); })
          .finally(() => this.loading = false)
      }
    },
    components: {
      UsersDashboard
    },
    mixins: [loadingMixin]
  }
</script>

<style lang="scss" scoped>
  p {
    font-size: 1em;
  }
</style>
