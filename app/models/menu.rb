class Menu < ApplicationRecord
  belongs_to :user
  validate :name, :description, :price, :portions, :availability, presence: true
end
