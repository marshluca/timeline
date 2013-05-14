class Category
  include Mongoid::Document

  field :name,     type: String
  field :slug,     type: String
  field :count,    type: Integer, default: 0
  field :postion,  type: Integer, default: -1

  belongs_to  :user
  embeds_many :taxons

  validates_presence_of :name

end
