class Product < ApplicationRecord
    #belongs to :profile | optional for customer_id when saving product
    belongs_to :customer, class_name: "Profile", optional: true
    belongs_to :vendor, class_name: "Profile"
    has_one_attached :picture
    # To ensure data is collected
    validates :state, presence: true
    validates :suburb, presence: true
    validates :street, presence: true
    validates :street_no, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :picture, presence: true

    geocoded_by :full_address
    after_validation :geocode

    def full_address
        
        [street_no, street, suburb, state].compact.join(',')
      
    end
end
