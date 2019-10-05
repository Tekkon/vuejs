<template lang="pug">
  q-dialog(v-model="show_user_edit")
    q-card
      q-card-section
        .text-h6 Alert

      q-card-section
        p Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum repellendus sit voluptate voluptas eveniet porro. Rerum blanditiis perferendis totam, ea at omnis vel numquam exercitationem aut, natus minima, porro labore.

      q-card-actions(align="right")
        q-btn(flat label="OK" color="primary" v-close-popup @click="$emit('popup-closed')")
</template>

<script>
  export default {
    props: ['show_user_edit'],
    data() {
      return {

      }
    }
  }
</script>
