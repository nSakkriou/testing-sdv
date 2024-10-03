<template>
  <div>
    <Parking ref="parkingRefs" v-for="parking of parkingList" :key="parking.id" :parking="parking" @open-modal="handleOpenParkingModal" />
  </div>
  <Modal ref="modal" title="Horaires">
    <div v-if="currentHours">
      <p>Lundi: {{ currentHours.monday?.opening }} / {{ currentHours.monday?.closure }}</p>
      <p>Mardi: {{ currentHours.tuesday?.opening }} / {{ currentHours.tuesday?.closure }}</p>
      <p>Mercredi: {{ currentHours.wednesday?.opening }} / {{ currentHours.wednesday?.closure }}</p>
      <p>Jeudi: {{ currentHours.thursday?.opening }} / {{ currentHours.thursday?.closure }}</p>
      <p>Vendredi: {{ currentHours.friday?.opening }} / {{ currentHours.friday?.closure }}</p>
      <p>Samedi: {{ currentHours.saturday?.opening }} / {{ currentHours.saturday?.closure }}</p>
      <p>Dimanche: {{ currentHours.sunday?.opening }} / {{ currentHours.sunday?.closure }}</p>
    </div>
  </Modal>
</template>

<script setup lang="ts">

import {ref, Ref} from "vue";
import {Parking as ParkingModel} from "../models/Parking.ts";
import {useParkingService} from "../composables/parking.service.ts";
import {OpeningCalendar} from "../models/OpeningCalendar.ts";
import Modal from "./partials/modal.vue";
import { useGeoService } from "../composables/geoloc.service.ts";
import { AxiosResponse } from "axios";
import Parking from "./Parking.vue";

const parkingList: Ref<Array<ParkingModel>> = ref([]);

const modal = ref();

const currentHours: Ref<OpeningCalendar | undefined> = ref<OpeningCalendar>();

useGeoService().getCoord().then(res => {
    let coord = res

    useParkingService().get(coord).then((data: AxiosResponse) => {
      let response = data.data as ParkingModel[]
      parkingList.value = response;
    })
});

function handleOpenParkingModal(calendar: OpeningCalendar) {
  currentHours.value = calendar;
  modal.value.open();
}

</script>

<style scoped>

</style>