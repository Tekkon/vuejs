<template>
  <div>
    <p>{{ title }}</p>
    <button @click="removeTodo">remove</button>
  </div>
</template>

<script>
  export default {
    props: ['title'],
    methods: {
      removeTodo() {
        this.$emit('remove-todo', this.title)
      }
    }
  }
</script>
