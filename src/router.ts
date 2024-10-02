import { createRouter, createWebHistory } from "vue-router"
import ParkingList from "./components/ParkingList.vue";
import StationList from "./components/StationList.vue"

const routes = [
    { path: '/', component: ParkingList, name : "Home"},
    { path: '/stations', component: StationList, name : "Station"}
]

const router = createRouter({
    history : createWebHistory(),
    routes
})

export default router