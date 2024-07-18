const fastify = require('fastify')({ logger: { level: 'info', prettifier: require('pino-pretty') } });
const port = 4501
const host = '0.0.0.0'

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
