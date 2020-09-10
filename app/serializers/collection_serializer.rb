class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :description, :source
  belongs_to :user
end
