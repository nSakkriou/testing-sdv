export interface Station {
	nom: string;
	coordonnees: {
		lon: number;
		lat: number;
	};
	distance: number;
}