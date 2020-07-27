class Product < ApplicationRecord
    #belongs to :profile | optional for customer_id when saving product
    belongs_to :customer, class_name: "Profile", optional: true
    belongs_to :vendor, class_name: "Profile"
    has_one_attached :picture
    # To ensure data is collected
    validates :state, presence: true
    validates :suburb, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :picture, presence: true
end
