class Client < ApplicationRecord
    has_many :gyms
    has_many :memberships

    validates :client_id, uniqueness: true
end
