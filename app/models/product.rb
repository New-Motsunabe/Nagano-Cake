class Product < ApplicationRecord
<<<<<<< HEAD
  has_many :genres, dependent: :destroy
  has_many :ordered_products, dependent: :destroy

<<<<<<< HEAD
  attachment :image, destroy: false
=======
   attachment :image, destroy: false
=======
  belongs_to :genres, dependent: :destroy

  attachment :image, destroy: false
>>>>>>> origin/develop
   
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
>>>>>>> origin/develop
end
