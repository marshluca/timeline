class Event
  include Mongoid::Document
  field :title, type: String
  field :category, type: String
  field :duration, type: Integer
  field :description, type: String
end
