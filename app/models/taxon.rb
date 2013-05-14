class Taxon
  include Mongoid::Document

  field :name,     type: String
  field :slug,     type: String
  field :count,    type: Integer, default: 0
  field :position, type: Integer, default: -1

  embedded_in :category

  validates_presence_of :name

  before_save :generate_slug


  private
    def generate_slug
      self.slug = self.name.downcase
    end

end
