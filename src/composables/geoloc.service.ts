export const useGeoService = () => {return {
    getCoord : async () : Promise<Coord> => {
        if(GEO_IS_AUTHORIZE) {
            return await new Promise<Coord>((resolve) => {
                navigator.geolocation.getCurrentPosition((position) => {
                    resolve({
                        lat : position.coords.latitude + "",
                        lon : position.coords.longitude + ""
                    })
                }, 
                () => {
                    resolve(
                        EMPTY_COORD
                    )
                })
            })
            
        }

        return EMPTY_COORD
    }
}}


export let GEO_IS_AUTHORIZE = navigator.geolocation
export interface Coord {
    lat: string
    lon : string
}

const EMPTY_COORD  = {
    lat : "",
    lon : ""
}