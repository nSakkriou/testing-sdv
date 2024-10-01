export interface OpeningCalendar {
	monday: Day;
	tuesday: Day;
	wednesday: Day;
	thursday: Day;
	friday: Day;
	saturday: Day;
	sunday: Day;
}

interface Day {
	opening: string;
	closure: string;
}