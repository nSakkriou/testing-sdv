<template>
    <nav>
      <h1>{{ parking?.name }}</h1>
      <button class="btn-danger" @click="goToHome">Retour</button>
    </nav>

    <div class="drawer">
      <div class="d-header">
        <button class="btn-drawer" :class="{
          'selected': showMetro
        }" @click="() => showMetro = true">Métro</button>
        <button class="btn-drawer" :class="{
          'selected': !showMetro
        }" @click="() => showMetro = false">Bus</button>
      </div>

      <div id="metro" v-if="showMetro">
        <p v-if="parking?.metroStations.length === 0">Pas de métro a proximité</p>
        <Station v-else v-for="station in parking?.metroStations" :station="station"></Station>
      </div>

      <div id="bus" v-if="!showMetro">
        <p v-if="parking?.busStations.length === 0">Pas de bus a proximité</p>
        <Station v-else v-for="station in parking?.busStations" :station="station"></Station>
      </div>
    </div>
    

</template>

<script setup lang="ts">
import { useRoute } from 'vue-router';
import { useParkingService } from '../composables/parking.service';
import { Ref, ref } from 'vue';
import { Parking } from '../models/Parking';
import Station from './Station.vue';
import { goToHome } from '../router';


const route = useRoute()
const parkingId = route.query.parkingId!
const parking : Ref<Parking | undefined> = ref<Parking>()

useParkingService().getById(parkingId + "").then(res => {
    let response = res.data as Parking[]
    parking.value = response[0]

    console.log(parking.value)
})

const showMetro : Ref<Boolean> = ref<boolean>(true)



</script>
<style scoped>
nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

#bus, #metro {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 1rem;
  margin-top: 2rem;
}

</style>