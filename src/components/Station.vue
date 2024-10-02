<template>
    <div>
        {{ props.station.name }}
        {{ props.station.nextPassage }}
    </div>    
</template>

<script lang="ts" setup>
import { Station } from '../models/Station';

const props = defineProps<{station : Station}>()

</script>
