require('dotenv').config();
const fastify = require('fastify')({ logger: { level: 'info', prettifier: require('pino-pretty') } });
const port = process.env.PORT;
const host = process.env.HOST;
const apiKey = process.env.SERVER_API_KEY;

const apiKeyValidation = async (req, res) => {
  const authorization = req.headers['authorization'];
  if (!authorization || authorization !== `ZeroOneGroup ${apiKey}`) {
    res.code(404).send({ message: 'Route ' + req.method + ':' + req.url + ' not found', error: 'Not Found', statusCode:404 });
    return;
  }
};

fastify.route({ method: 'GET', url: '/api/v1/hello_world/', preHandler: apiKeyValidation, handler: (req, res) => {
  return { message: 'Hello World!', statusCode:200 };
}});

fastify.get('/api/v1/status/', (req, res) => {
  return { status: 'ok' };
});

fastify.listen({ host: host, port: port }, (err) => {
  if (err) {
    fastify.log.error(err);
  }
});
