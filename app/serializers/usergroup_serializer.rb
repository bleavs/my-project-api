class UsergroupSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
  belongs_to :group
end
