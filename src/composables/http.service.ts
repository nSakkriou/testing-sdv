import axios from "axios";
import { isLocal } from "../islocal";

const API_LOCAL_URL = 'https://data.explore.star.fr/api/explore/v2.1/'
const API_PROD_URL = "http://prod"

const URL: string = isLocal() ? API_LOCAL_URL :  API_PROD_URL;

const get = async (resourcePath: string) => {
	return await axios.get(`${URL}/${resourcePath}`);
}

export const httpService = {
	get: (resourcePath: string) => get(resourcePath),
}