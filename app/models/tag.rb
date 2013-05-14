class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,  type: String
  field :slug,  type: String
  field :count, type: Integer, default: 0

  belongs_to :user

  validates_presence_of :name

end
