import Express from 'express';
import creatorValidator from '../validators/creatorValidator.js';
import db_connection from '../db/db_connection.js';

const router = Express.Router();

router.post('/', creatorValidator, async (req, res, next) => {
	try {
		let data = req.body;
		let Db = await db_connection;
		let writeToDb = await Db.insertOne(data);
		console.log(writeToDb);
		res.json({
			status: 200,
			data: data,
		});
	} catch (error) {
		console.log(error);
	}
	next();
});

export default router;
