class Event
  include Mongoid::Document
  field :title, type: String
  field :category, type: String
  field :duration, type: Integer, :default => 0
  field :description, type: String

  validates :title,    presence: true
  validates :category, presence: true
  validates :duration, presence: true
end
