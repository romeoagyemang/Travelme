import { faker } from '@faker-js/faker';
import db_connection from './db_connection.js';

//this function test to see if the is sample data in database
//if not it generated data to work with
let categories = [
	'resturant',
	'Hotel',
	'Guest House',
	'Event Center',
	'Bank',
	'School',
	'Hospital',
];

function getRandomValue() {
	const random = Math.random();

	const scaledRandom = random * 7;

	return Math.floor(scaledRandom);
}
let description =
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce placerat rhoncus nunc ut gravida. Nam justo sem, mollis lobortis sapien et, rutrum placerat sapien. Aenean eu lorem volutpat, vehicula massa sit amet, molestie tortor. Nullam porta neque ac tempus ullamcorper. Mauris laoreet tempus leo in efficitur.';
export default async function () {
	//request for data from db;
	const places = await db_connection;
	const place = await places.findOne();
	if (place == null) {
		let data = [];
		for (let i = 0; i <= 20; i++) {
			data.push({
				name: `${faker.person.lastName()}'s Place`,
				location: faker.location.city(),
				description,
				contact: faker.phone.number(),
				category: categories[getRandomValue()],
			});
		}
		let insertFakeData = places.insertMany(data);
		if (insertFakeData) {
			console.log('fake Data populated in DB');
		}
	}
}
