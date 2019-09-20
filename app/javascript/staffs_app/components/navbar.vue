<template lang="pug">
  div
    img(:src="require('images/logo.png')" width="20px;")
    span {{ email }}
    button(@click="$emit('sign-out')") Выход
</template>

<script>
  export default {
    props: ['email'],
    methods: {
    }
  }
</script>
