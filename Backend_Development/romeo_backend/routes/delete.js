import Express from 'express';
import queryValidator from '../validators/deleteValidator.js';
import db_connection from '../db/db_connection.js';
import { ObjectId } from 'mongodb';

const router = Express.Router();

router.delete('/:placeId', queryValidator, async (req, res, next) => {
	try {
		let placeId = req.params.placeId;
		const db = await db_connection;
		let operation = await db.findOneAndDelete({ _id: new ObjectId(placeId) });
		if (operation != null) {
			res.json({
				status: 200,
				data: operation,
			});
		}
		res.json({
			status: 400,
			data: 'null',
			message: 'Please provide a correct place id',
		});
	} catch (error) {
		console.log(error);
	}
});

export default router;
