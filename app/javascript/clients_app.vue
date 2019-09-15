<template>
  <div v-if="loading">
    <p>Загрузка...</p>
  </div>
  <div v-else>
    <div v-if="error">
      <p>Ошибка</p>
    </div>
    <div v-else>
      <input v-model="title">
      <button @click="addTodo">add todo</button>
      <todo v-for="item in list" :title="item.title" :key="item.id" @remove-todo="remove"></todo>
    </div>
  </div>
</template>

<script>
  import Todo from 'clients_app/components/todo.vue'
  import api from 'clients_app/api'

  export default {
    data () {
      return {
        loading: true,
        error: false,
        title: '',
        list: []
      }
    },
    created() {
      this.getList();
    },
    methods: {
      addTodo() {
        this.list.push({ title: this.title })
        this.title = ''
      },
      remove(title) {
        this.list = this.list.filter((item) => {
          if (item.title !== title) return item
        })
      },
      getList() {
        api.getList()
          .then((response) => this.list = response.data)
          .catch(() => this.error = true)
          .finally(() => this.loading = false)
      }
    },
    components: {
      Todo
    }
  }
</script>

<style scoped>
  p {
    font-size: 1em;
  }
</style>
