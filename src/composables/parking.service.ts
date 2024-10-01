import {Parking} from "../models/Parking.ts";

export const useParkingService = () => {
	return {
		get: async (): Promise<Parking[]> => {
			return new Promise<Parking[]>((resolve) => {
				resolve([
					{ id: "123456789", name: "Parking" } as Parking,
				])
			});
		},
	}
}