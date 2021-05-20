class Product < ApplicationRecord
  belongs_to :genres, dependent: :destroy

  attachment :image, destroy: false
   
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :image, presence: true
end
