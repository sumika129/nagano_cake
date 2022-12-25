class Order < ApplicationRecord


  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  enum payment_method: { credit_card: 0, transfer: 1 }
end
