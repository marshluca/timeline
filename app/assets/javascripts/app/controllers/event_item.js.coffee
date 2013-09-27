class App.EventItem extends Spine.Controller
  events:
    "click [data-type=edit]": "edit"
    "click [data-type=destroy]": "destroy"

  constructor: (params) ->
    super
    @item = params.item
    @active @render

  @render: =>
    @html @view('events/show')(@item)

  edit: (e) ->
    item = $(e.target).item()
    @navigate '/events', item.id, 'edit'

  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
