class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shipping_addresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items

  validates :last_name, presence: true
  validates :kana_last_name, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :first_name, presence: true
  validates :kana_first_name, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :postal_code, presence: true, format: {with: /\A[0-9]+\z/}
  validates :residence, presence: true
  validates :phone_number, presence: true, format: {with: /\A[0-9]+\z/}




  def active_for_authentication?
    super && (is_deleted == false)
  end


end



