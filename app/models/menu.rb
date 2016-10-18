class Menu < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :portions, :availability, presence: true
end
