class GroupSerializer < ActiveModel::Serializer
  attributes :id

  has_many :usergroups
  has_many :users, through: :usergroups
end
