#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  elements:
    "#center": "centerSection"

  constructor: ->
    super

    # Initialize controllers:
    center = new App.Events({el :$("#center")})
    @centerSection.html(center)

    App.Event.one 'refresh', ->
      Spine.Route.setup(history: true)

window.App = App
