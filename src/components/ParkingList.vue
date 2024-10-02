<template>

</template>

<script setup lang="ts">

import {ref, Ref} from "vue";
import {Parking} from "../models/Parking.ts";
import {useParkingService} from "../composables/parking.service.ts";

const parkingList: Ref<Array<Parking>> = ref([]);

useParkingService().get().then((data: Parking[]) => {
  parkingList.value = data;
});

</script>

<style scoped>

</style>