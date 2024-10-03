<template>
    <div>
        {{ props.station.nom }}
    </div>    
</template>

<script lang="ts" setup>
import { Station } from '../models/Station';

const props = defineProps<{station : Station}>()

</script>
