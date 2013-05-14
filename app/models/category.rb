class Category
  include Mongoid::Document

  field :name,     type: String
  field :slug,     type: String
  field :postion,  type: Integer
  field :count,    type: Integer, default: 0
  field :subcates, type: Array

  belongs_to :user

  validates_presence_of :name

end
