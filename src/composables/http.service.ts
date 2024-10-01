import axios from "axios";

const URL: string = 'https://data.explore.star.fr/api/explore/v2.1/';

const get = async (resourcePath: string) => {
	return await axios.get(`${URL}/${resourcePath}`);
}

export const httpService = {
	get: (resourcePath: string) => get(resourcePath),
}