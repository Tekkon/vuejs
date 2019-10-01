<template lang="pug">
  q-header(elevated class="bg-primary text-white")
    div
      q-toolbar
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
