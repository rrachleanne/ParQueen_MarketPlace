class Profile < ApplicationRecord
  belongs_to :user
  #self ref has many products with different foreign keys- class name product| dependent: :destroy to delete any products that relate to vendor after they delete their profile
  has_many :products_to_purchase, class_name: "Product", foreign_key: "customer_id"
  has_many :products_to_sell, class_name: "Product", foreign_key: "vendor_id", dependent: :destroy
  has_one_attached :picture
  
  # To ensure data is collected
  validates :picture, presence: true
  validates :name, presence: true
  validates :phone, presence: true
end
