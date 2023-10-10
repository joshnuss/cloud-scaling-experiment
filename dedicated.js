import express from 'express'
import handler from './routes.js'

const app = express()

app.all('/*', (req, res) => {
  req.mode = 'dedicated'

  return handler(req, res)
})

app.listen(3000)
