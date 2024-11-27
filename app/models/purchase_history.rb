class PurchaseHistory < ApplicationRecord
  # belongs_to :user, class_name: 'UserInfo', foreign_key: :user_id

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates_uniqueness_of :product_id, scope: :user_id
end

