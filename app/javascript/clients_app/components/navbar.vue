<template lang="pug">
  div
    img(src="../../../assets/images/logo.png" width="20px;")
    span {{ email }}
    button(@click="signOut")
</template>

<script>
  export default {
    props: ['email'],
    methods: {
      signOut() {

      }
    }
  }
</script>
