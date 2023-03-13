class ClientMembershipSerializer < ActiveModel::Serializer
  attributes :name, :age
  has_many :memberships
end
