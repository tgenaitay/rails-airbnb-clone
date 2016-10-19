class Menu < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :portions, :availability, presence: true
  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?
end
