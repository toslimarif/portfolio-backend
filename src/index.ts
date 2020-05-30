import express from 'express';

const app = express();

app.get('/', (req, res) => {
  res.send('Hello World !');
});

app.listen(80, () => {
  // tslint:disable-next-line: no-console
  console.log('API server is listening on port 80!');
});
