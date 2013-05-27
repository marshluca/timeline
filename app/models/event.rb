class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  STATE = { done: 0, todo: 1, doing: 2, reject: 3 }

  field :title,       type: String
  field :description, type: String
  field :location,    type: String
  field :start_time,  type: Datetime
  field :end_time,    type: Datetime
  field :duration,    type: Integer, default: 0  # minutes as unit
  filed :date,        type: Date,    default: Date.today
  field :category,    type: String,  default: 'Default'
  field :subcate,     type: String,  default: 'Default'
  field :tags,        type: Array,   default: Array.new
  field :coordinate,  type: Array,   default: Array.new(2, 0.0)
  field :stars,       type: Integer, default: 0
  field :state,       type: Integer, default: STATE[:done]

  belongs_to :user, inverse_of: :event

  validates_presence_of :title

end
