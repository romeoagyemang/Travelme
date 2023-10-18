import Express from 'express';
import db_connection from '../db/db_connection.js';
import { ObjectId } from 'mongodb';

const router = Express.Router();

router.put('/', async (req, res, next) => {
	try {
		let id = req.body.id;
		let updates = req.body;
		delete updates.id;

		let db = await db_connection;
		let update = await db.findOneAndUpdate(
			{ _id: new ObjectId(id) },
			{ $set: updates }
		);
		if (update) {
			res.json({
				status: 200,
				data: update,
			});
		}
	} catch (error) {
		console.log(error);
	}

	next();
});

export default router;
