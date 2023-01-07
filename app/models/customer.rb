class Customer < ApplicationRecord
  has_one_attached :image

  has_many :cart_items
  has_many :addresses
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + last_name + ' ' + first_name
  end
end
