class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category

  with_options presence: true do
   validates :title
   validates :detail
   validates :category_id
   validates :condition_id
   validates :handling_payer_id
   validates :prefecture_id
   validates :lead_time_id
   validates :price
   validates :image
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
  end
end
