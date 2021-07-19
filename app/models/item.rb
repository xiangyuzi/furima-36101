class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :handling_payer
  belongs_to :prefecture
  belongs_to :lead_time

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
    validates :condition_id
    validates :handling_payer_id
    validates :prefecture_id
    validates :lead_time_id
  end

  validates :price, inclusion: {in: 300..9999999, message: 'is out of setting range'}
  validates :price, numericality: { only_integer: true, format: {with: /\A[0-9]+\Z/}, message: 'is invalid. Input half-width characters'}
end
