$ = jQuery.sub()
Event = App.Event

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Event.find(elementID)

class App.EventItem extends Spine.Controller
  events:
    "click [data-type=edit]": "edit"
    "click [data-type=destroy]": "destroy"

  constructor: (id)->
    super
    @change(id)

  change: (id) ->
    @item = Event.find(id)
    @render()

  render: =>
    @html @view('events/show')(@item)

  edit: (e) ->
    item = $(e.target).item()
    @navigate '/events', item.id, 'edit'

  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
