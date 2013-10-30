HomeController = new(require "./controller/HomeController.coffee")

configure = (app) =>
	app.get "/", HomeController.home

exports.configure = configure