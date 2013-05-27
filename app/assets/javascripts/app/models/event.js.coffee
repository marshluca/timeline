class App.Event extends Spine.Model
  @configure 'Event', 'title', 'description', 'duration', 'category', 'tags', 'stars', 'state'
  @extend Spine.Model.Ajax