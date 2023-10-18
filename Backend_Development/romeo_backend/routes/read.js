import Express from 'express';
import db_connection from '../db/db_connection.js';
import { ObjectId } from 'mongodb';

const router = Express.Router();

//returns all places in the database
router.get('/', async (req, res, next) => {
	try {
		let Db = await db_connection;
		let data = await Db.find();
		console.log(data);
		res.json({
			status: 200,
			data: data,
		});
		next();
	} catch (error) {
		console.log(error);
	}
});

//returns a particular place from the database
router.get('/:placeId', async (req, res, next) => {
	try {
		let DB = await db_connection;
		let data = await DB.findOne({ _id: new ObjectId(req.params.placeId) });
		console.log(data);
		res.send(data);
	} catch (error) {
		console.log(error);
	}
});
export default router;
