require 'date'
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  def buddy_date
    self.date.strftime("%e %B, %Y")
  end
end
