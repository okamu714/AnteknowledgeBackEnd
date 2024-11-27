class UserInfo < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true

  has_many :purchase_histories, foreign_key: :user_id
end
