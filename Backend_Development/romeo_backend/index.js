import express from 'express';
import creator from './routes/create.js';
import bodyParser from 'body-parser';
import reads from './routes/read.js';
import remove from './routes/delete.js';
import update from './routes/update.js';
import db_connection from './db/db_connection.js';
import faker from './db/faker.js';
import logger from './logs/logger.js';
import 'dotenv/config.js';

const PORT = process.env.PORT;
const app = express();

//middlewares
app.use(bodyParser.json());
app.use('/create', creator);
app.use('/places', reads);
app.use('/delete', remove);
app.use('/update', update);

//initialing server
app.listen(PORT, async () => {
	try {
		let dbConnection = await db_connection;
		await faker();
		if (dbConnection) {
			console.log('connection to db successfull');
			logger.log('info', 'server is running');
			console.log(`Server is running on port ${PORT}`);
		}
	} catch (error) {
		throw error;
	}
});
