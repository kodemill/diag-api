const express = require('express')

const port = 1337
const host = '0.0.0.0'

const app = express()

app.get('/text/ping', (_, res) => {
  res.set('Content-Type', 'text/plain').send('pong\n')
})

app.get('/json/headers', (req, res) => {
  res.json(req.headers)
})

app.get('/json/500', (_, res) => {
  res.status(500).json({ message: 'you asked for 500' })
})

app.use((err, _, res, next) => {
  if (res.headersSent) {
    return next(err)
  }
  res.status(500).json({ message: '🔥 smg went wrong for real 🔥' })
})

app.listen(port, host, () => {
  console.log(`diag-api listening on ${host}:${port}`)
})
