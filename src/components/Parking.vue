<template>
  <div class="parking" :id="props.parking.id">
    <h2><span :class="{
      status : true,
      bgdanger : props.parking.status !== 'OUVERT',
      bgdsecondary : props.parking.status === 'OUVERT'
    }"
      
    >{{ props.parking.status.toLowerCase() }}</span> <span>{{ props.parking.name }}</span></h2>

    <div class="controls">
      <button class="btn-primary" @click="handleOpenModal">
        Voir les horaires
      </button>
      <button class="btn-secondary" @click="goToStations">
        Voir les stations
      </button>
    </div>

    <p>Test</p>
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
  box-shadow: 2px 2px 0px rgba(0, 0, 0, 0.3);
}

.controls {
  display: flex;
  gap: 1rem;
}

.status {
  font-size: 1.2rem;
  padding: 4px 8px;
  border: 2px solid black;
  margin-right: 1rem;
}
</style>