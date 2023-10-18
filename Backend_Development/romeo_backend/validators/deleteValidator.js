export default async (req, res, next) => {
	try {
		if (typeof req.params.placeId != 'string') {
			res.json({
				status: 400,
				message: 'check query params and try again, must be of type string',
			});
		}
		next();
	} catch (error) {
		console.log(error);
	}
};
