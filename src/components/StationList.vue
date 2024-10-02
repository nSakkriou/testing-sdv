<template>
    <nav>
        <button @click="goToHome">Retour</button>
        <button @click="() => showMetro = true">Métro</button>
        <button @click="() => showMetro = false">Bus</button>
    </nav>
    
    <div id="metro" v-if="showMetro">
        <Station v-for="station in parking?.metroStations" :station="station"></Station>
    </div>

    <div id="bus" v-if="!showMetro">
        <Station v-for="station in parking?.busStations" :station="station"></Station>
    </div>
</template>

<script setup lang="ts">
import { useRoute } from 'vue-router';
import { useParkingService } from '../composables/parking.service';
import { Ref, ref } from 'vue';
import { Parking } from '../models/Parking';
import Station from './Station.vue';
import router, { goToHome } from '../router';


const route = useRoute()
const parkingId = route.query.parkingId!
const parking : Ref<Parking | undefined> = ref<Parking>()

useParkingService().getById(parkingId + "").then(res => {
    parking.value = res
})

const showMetro : Ref<Boolean> = ref<boolean>(true)

</script>