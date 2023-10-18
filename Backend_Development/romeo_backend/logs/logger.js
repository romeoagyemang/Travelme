import winston from 'winston';

const logger = winston.createLogger({
	format: winston.format.json(),
	transports: [
		new winston.transports.File({
			filename: 'logs/logs.log',
		}),
	],
});

export default logger;
