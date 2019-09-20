<template lang="pug">
  div
    img(:src="require('images/logo.png')" width="20px;")
    span {{ email }}
    a(href="/staffs/sign_out") Выход
</template>

<script>
  export default {
    props: ['email'],
    methods: {
    }
  }
</script>
