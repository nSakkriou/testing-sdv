<template>
    <button @click="() => { openInNewTab(`https://www.google.com/maps/place/${props.station.coordonnees.lat},${props.station.coordonnees.lon}`) }" class="station">
      <div>
        <p>{{ props.station.nom }}</p>
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><g fill="none"><path d="m12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035q-.016-.005-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427q-.004-.016-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093q.019.005.029-.008l.004-.014l-.034-.614q-.005-.018-.02-.022m-.715.002a.02.02 0 0 0-.027.006l-.006.014l-.034.614q.001.018.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"/><path fill="currentColor" d="M11 6a1 1 0 1 1 0 2H5v11h11v-6a1 1 0 1 1 2 0v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2zm9-3a1 1 0 0 1 1 1v5a1 1 0 1 1-2 0V6.414l-8.293 8.293a1 1 0 0 1-1.414-1.414L17.586 5H15a1 1 0 1 1 0-2Z"/></g></svg>
      </div>
      <div>
          <p>Distance : {{ props.station.distance.toPrecision(2) }}km</p>
      </div>
    </button>
</template>

<script lang="ts" setup>
import { Station } from '../models/Station';

function openInNewTab(href: string) {
  Object.assign(document.createElement('a'), {
    target: '_blank',
    rel: 'noopener noreferrer',
    href: href,
  }).click();
}

const props = defineProps<{station : Station}>()

</script>
<style>
.station div:nth-child(1) {
  padding: 0.5rem 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
}

.station svg {
  width: 18px;
}
</style>
