class UserInfo < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
end
