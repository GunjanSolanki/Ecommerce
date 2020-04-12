class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_one :shopping_cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 } 
  validates :email, uniqueness: true
  validates :address, presence: true
  validates :password, presence: true, confirmation: true

  enum gender: [:male, :female]

  after_save :create_shopping_cart

  def create_shopping_cart
    @shopping_cart = ShoppingCart.create(user_id: self.id)
  end

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end 