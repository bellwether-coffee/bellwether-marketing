express = require 'express'
router = express.Router()

router.get '/', (req, res) ->
  res.render 'home'

router.get '/about', (req, res) ->
  res.render 'about'

router.get '/contact', (req, res) ->
  res.render 'contact'

router.get '/thank-you', (req, res) ->
  res.render 'thank-you', 

module.exports = router
