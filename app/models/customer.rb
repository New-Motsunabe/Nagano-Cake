class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shipping_addresses, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items

  validates :last_name, presence: true
  validates :kana_last_name, presence: true
  validates :first_name, presence: true
  validates :kana_first_name, presence: true
  validates :residence, presence: true
  validates :phone_number, presence: true


  def active_for_authentication?
    super && (is_deleted == false)
  end


end



