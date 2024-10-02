<template>
 {{ parkingId }}
</template>

<script setup lang="ts">
import { useRoute } from 'vue-router';
import { useParkingService } from '../composables/parking.service';
import { Ref, ref } from 'vue';
import { Parking } from '../models/Parking';


const route = useRoute()
const parkingId = route.query.parkingId!

const parking : Ref<Parking | undefined> = ref<Parking>()

useParkingService().getById(parkingId + "").then(res => {
    parking.value = res
})

</script>