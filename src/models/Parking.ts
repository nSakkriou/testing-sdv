import {Station} from "./Station.ts";
import {OpeningCalendar} from "./OpeningCalendar.ts";


export interface Parking {
	id: string;
	name: string;
	busStations: Station[]
	metroStations: Station[]
	openingCalendar: OpeningCalendar
	status : string
}