import { Validator } from 'jsonschema';

const validate = new Validator();

//validation schemma
const schemma = {
	id: '/001',
	type: 'object',
	properties: {
		name: { type: 'string', minLength: 5 },
		location: { type: 'string', minLength: 5 },
		description: { type: 'string', minLength: 5 },
		contact: { type: 'string', minLength: 10 },
		category: { type: 'string', minLength: 5 },
	},
	required: ['name', 'location', 'description', 'contact', 'category'],
};

//middleware
export default async (req, res, next) => {
	try {
		let payload = [];
		let data = req.body;
		let { errors } = validate.validate(data, schemma);

		if (errors.length == 0) {
			next();
			return;
		}

		for (let error of errors) {
			let value = error.path[0];
			let message = error.message;
			payload.push({ value, message });
		}
		res.json({
			status: 400,
			data: payload,
		});
	} catch (error) {
		console.log(error);
	}
};
