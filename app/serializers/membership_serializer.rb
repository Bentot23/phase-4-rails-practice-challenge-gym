class MembershipSerializer < ActiveModel::Serializer
  attributes :charge, :gym_id, :client_id
end
