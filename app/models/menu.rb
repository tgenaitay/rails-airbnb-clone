class Menu < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :description, :price, :portions, :availability, presence: true
  validates_inclusion_of :category, :in => ["lunch", "dinner"], :allow_nil => false
  has_attachment :photo

  before_save :check_stock

  def ordered_quantity()
    orders.inject(0){|sum,x| sum + (x.approved == false ? 0 : x.portions) }
  end

  def check_stock
    qtt = self.ordered_quantity()
    if qtt > self.portions
      errors[:base] <<  "#{qtt} portion#{qtt>1 ? 's' : ''} are already booked, you can not have less portions available"
      throw :abort
    end

  end

end
