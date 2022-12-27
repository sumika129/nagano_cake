class Order < ApplicationRecord


  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { wait_payment: 0, confirmation: 1, production: 2, preparation: 3, ship: 4 }
end
