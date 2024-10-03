<template>
  <div class="parking">
    <h2>{{ props.parking.name }} <span> - {{ props.parking.status }}</span></h2>

    <div class="controls">
      <button class="btn-primary" @click="handleOpenModal">
        Voir les horaires
      </button>
      <button class="btn-secondary" @click="goToStations">
        Voir les stations
      </button>
    </div>
  </div>

</template>

<script setup lang="ts">
import { Parking } from "../models/Parking.ts";
import { useRouter } from "vue-router";

const props = defineProps<{
  parking: Parking;
}>();

console.log(props.parking)

const router = useRouter()

const emit = defineEmits(["open-modal"]);

function handleOpenModal() {
  emit("open-modal", props.parking.openingCalendar);
}

function goToStations() {
  router.push({ path: "/stations", query: { parkingId: props.parking.id + "" } })
}

</script>

<style scoped>
.parking {
  border: 2px solid black;
  align-items: center;
  justify-content: space-between;
  display: flex;
  padding: 1rem;
}

.controls {
  display: flex;
  gap: 1rem;
}
</style>