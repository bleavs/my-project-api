class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :usergroups
  has_many :groups, through: :usergroups

end
