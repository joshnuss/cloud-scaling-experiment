import functions from '@google-cloud/functions-framework'
import handler from './routes.js'

functions.http('main', (req, res) => {
  req.mode = 'cloud-function'

  return handler(req, res)
})
