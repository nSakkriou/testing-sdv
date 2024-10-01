import {Parking} from "../models/Parking.ts";

export const useParkingService = () => {
	return {
		get: (): Parking[] => {
			return []
		},
	}
}