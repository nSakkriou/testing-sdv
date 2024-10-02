import { resolve } from "path";
import {Parking} from "../models/Parking.ts";
import { Coord } from "./geoloc.service.ts";

export const useParkingService = () => {
	return {
		get: async (coord : Coord): Promise<Parking[]> => {
			return new Promise<Parking[]>((resolve) => {
				resolve([
					{ 
						id: "123456789", name: "Parking", busStations: [ {name: "Bus station", nextPassage: "10h"} ], metroStations: [ {name: "Metro station", nextPassage: "12h"} ], openingCalendar: {
						monday: { opening: "10h", closure: "11h"},
						tuesday: { opening: "10h", closure: "11h"},
						wednesday: { opening: "10h", closure: "11h"},
						thursday: { opening: "10h", closure: "11h"},
						friday: { opening: "10h", closure: "11h"},
						saturday: { opening: "10h", closure: "11h"},
						sunday: { opening: "10h", closure: "11h"},
					}} as Parking,
				])
			});
		},

		getById: async (id: string) :Promise<Parking> => {
			return new Promise<Parking>((resolve) => {
				resolve({ 
					id: "123456789", name: "Parking", busStations: [ {name: "Bus station", nextPassage: "10h"} ], metroStations: [ {name: "Metro station", nextPassage: "12h"} ], openingCalendar: {
					monday: { opening: "10h", closure: "11h"},
					tuesday: { opening: "10h", closure: "11h"},
					wednesday: { opening: "10h", closure: "11h"},
					thursday: { opening: "10h", closure: "11h"},
					friday: { opening: "10h", closure: "11h"},
					saturday: { opening: "10h", closure: "11h"},
					sunday: { opening: "10h", closure: "11h"},
				}} as Parking)
			})
		}
	}
}