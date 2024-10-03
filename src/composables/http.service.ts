import axios from "axios";


const URL: string = "https://rats-api.nathansakkriou.com/api";

const get = async (resourcePath: string, params : {}) => {
	let url = `${URL}/${resourcePath}`
	if(Object.keys(params).length > 0) {
		url += "?"
	}

	for (const key of Object.keys(params)) {
		url = url + key + "=" + encodeURI(params[key as keyof Object] + "") + "&"
	}
	
	return await axios.get(url);
}

export const httpService = {
	get: (resourcePath: string, params: {}) => get(resourcePath, params),
}