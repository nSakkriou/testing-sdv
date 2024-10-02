<template>
  <div v-if="isShown" class="modal">
    <div class="m-header">
      <h2>{{ props.title }}</h2>
      <button class="btn-danger" @click="() => { isShown = false }">Fermer</button>
    </div>
    <div class="m-body">
      <slot></slot>
    </div>
  </div>
</template>

<script setup lang="ts">

import {ref} from "vue";

const props = defineProps<{
  title: string;
}>();

const isShown = ref<boolean>(false);

defineExpose({
  open: () => {
    isShown.value = true;
  }
})

</script>

<style scoped>
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border: 2px solid black;
}

.m-header {
  display: flex;
  padding: 1rem;
  gap: 3rem;
}

.m-body {
  padding: 1rem;
}
</style>