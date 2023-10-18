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
};

//middleware
export default (req, res, next) => {
	try {
		let data = req.body;
		let { errors } = validate.validate(data, schemma);

		if (errors.length == 0) {
			next();
			return;
		}

		const validatorPayload = errors.map((error) => ({
			value: error.path[0],
			message: error.message,
		}));

		res.json({
			status: 400,
			data: validatorPayload,
		});
	} catch (error) {
		console.log(error);
	}
};
