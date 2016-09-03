express = require 'express'
router = express.Router()

router.get '/', (req, res) ->
  res.render 'home', { title: 'Home' }

router.get '/about', (req, res) ->
  res.render 'about', { title: 'About' }

router.get '/contact', (req, res) ->
  res.render 'contact', { title: 'Contact' }

module.exports = router
