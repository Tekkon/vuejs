class Organization < ApplicationRecord
  has_many :clients, through: :client_organizations

  include PgSearch::Model
  pg_search_scope :search, against: [:title, :inn, :ogrn]

  after_save :broadcast

  def broadcast
    ActionCable.server.broadcast('organizations', { organization: self })
  end
end
