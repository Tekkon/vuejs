class Organization < ApplicationRecord
  has_many :clients, through: :client_organizations
end
