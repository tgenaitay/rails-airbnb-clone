require 'date'
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  validates :portions, numericality: { only_integer: true, greater_than: 0 }

  before_save :check_stock

  def buddy_date
    self.date.strftime("%e %B, %Y")
  end

  def friendly_date
    self.created_at.strftime("%e %B, %Y")
  end

  private

  def check_stock
    left = self.menu.portions - self.menu.ordered_quantity(self)
    if (self.portions) > left
      errors[:portions] <<  "You can not order more than #{left} portion#{left>1 ? 's' : ''}"
      throw :abort
    end

  end

end
