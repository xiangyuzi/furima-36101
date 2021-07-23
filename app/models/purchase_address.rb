class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message:"is invalid. Enter it as follows(e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10}+\z|\A[0-9]{11}+\z/, message: "is too short"}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :phone_number, numericality: {only_integer: true,  message: "is invalid. Input only number" }
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end