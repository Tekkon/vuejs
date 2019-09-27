<template lang="pug">
  div.q-pa-md
    clients-form(:clients="clients" @client-form-submitted="clientFormSubmitted")
    clients-table(:clients="clients" @client-delete-row="clientDeleteRow")
</template>

<script>
  import ClientsForm from 'staff_components/clients/clientsForm.vue'
  import ClientsTable from 'staff_components/clients/clientsTable.vue'
  import loadingMixin from 'mixins/loading_mixin'

  export default {
    props: ['clients'],
    data() {
    },
    methods: {
      clientFormSubmitted({ client }) {
        this.$emit('client-form-submitted', client);
      },
      getClients() {
        this.$api.clients.index()
          .then(({ data }) => this.clients = data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      },
      clientDeleteRow(data) {
        this.$emit('client-delete-row', data);
      }
    },
    components: {
      ClientsForm,
      ClientsTable
    },
    mixins: [loadingMixin]
  }
</script>
