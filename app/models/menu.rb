class Menu < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :portions, :availability, presence: true
  validates_inclusion_of :category, :in => ["lunch", "dinner"], :allow_nil => false
  has_attachment :photo

  require 'date'

  def friendly_date
    self.availability.strftime("%e %B, %Y")
  end

end
