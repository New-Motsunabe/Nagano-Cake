class Product < ApplicationRecord
  has_many :genres, dependent: :destroy
  has_many :ordered_products, dependent: :destroy

<<<<<<< HEAD
  attachment :image, destroy: false
=======
   attachment :image, destroy: false
   
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
>>>>>>> origin/develop
end
