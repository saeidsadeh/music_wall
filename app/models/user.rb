class User < ActiveRecord::Base

  validates :email, presence: true, length: { maximum: 40 }
  validates :password, presence: true, length: { maximum: 40 }


end