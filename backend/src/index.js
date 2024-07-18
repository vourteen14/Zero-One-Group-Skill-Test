require('dotenv').config();
const fastify = require('fastify')({ logger: { level: 'info', prettifier: require('pino-pretty') } });
const port = 4501
const host = '0.0.0.0'
const apiKey = process.env.SERVER_API_KEY;

const apiKeyValidation = async (req, res) => {
  const authorization = req.headers['authorization'];
  if (!authorization || authorization !== `ZeroOneGroup ${apiKey}`) {
    res.code(404).send({ message: 'Route ' + req.method + ':' + req.url + ' not found', error: 'Not Found', statusCode:404 });
    return;
  }
};

fastify.addHook('preHandler', apiKeyValidation);

fastify.get('/api/v1/hello_world/', (req, res) => {
  return { message: 'Hello World!', statusCode:200 };
});

fastify.get('/api/v1/status/', (req, res) => {
  return { status: 'ok' };
});

fastify.listen({ host: host, port: port }, (err) => {
  if (err) {
    fastify.log.error(err);
  }
});
