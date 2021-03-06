class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name,{presence: true}
         validates :email,{presence: true, uniqueness: true}

  has_many :posts
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :image

end
