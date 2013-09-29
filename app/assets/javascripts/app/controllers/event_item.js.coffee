$ = jQuery.sub()
Event = App.Event

class App.EventItem extends Spine.Controller
  events:
    "click [data-type=edit]": "edit"
    "click [data-type=destroy]": "destroy"

  constructor: (params)->
    super
    @change(params.id)

  change: (id) ->
    @item = Event.find(id)
    @render()

  render: =>
    @html @view('events/show')(@item)

  edit: (e) ->
    @navigate '/events', @item.id, 'edit'

  destroy: (e) ->
    @item.destroy() if confirm('Sure?')
