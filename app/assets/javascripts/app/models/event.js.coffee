class App.Event extends Spine.Model
  @configure 'Event',
    'title', 'description', 'duration', 'date', 'start_time', 'end_time',
    'category', 'subcate', 'tags', 'location', 'stars', 'state'

  @extend Spine.Model.Ajax
