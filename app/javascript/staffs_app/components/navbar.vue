<template>
  <div>
    <img src="../../../assets/images/logo.png" width="20px;" />
    <span>{{ email }}</span>
    <button @click="$emit('sign-out')">Выход</button>
  </div>
</template>

<script>
  export default {
    props: ['email'],
    methods: {
    }
  }
</script>
