class HomeController

	home : (req, res) =>
		res.render "home/view/index"

module.exports = HomeController