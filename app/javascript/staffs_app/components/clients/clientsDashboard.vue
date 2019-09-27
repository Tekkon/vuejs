<template lang="pug">
  div.q-pa-md
    client-form(:clients="clients" @client-form-submitted="clientFormSubmitted")
</template>

<script>
  import ClientForm from 'staff_components/clients/clientForm.vue'
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
      }
    },
    components: {
      ClientForm
    },
    mixins: [loadingMixin]
  }
</script>
