class Product < ApplicationRecord
    #PROFILE belongs to :profile | optional for customer_id when saving product
    belongs_to :customer, class_name: "Profile", optional: true
    belongs_to :vendor, class_name: "Profile"
    has_one_attached :picture

    #ensuring the correct image is uploaded
    validate :correct_picture_mime_type

    private
    def correct_picture_mime_type
        if picture.attached? && !picture.content_type.in?(%w(image/png image/jpeg image/jpg image/gif))
            errors.add(:picture, 'must be a: png, gif, jpeg or jpg file type')
        end
    end
    #PRODUCT To ensure data is collected on product form
    validates :state, presence: true
    validates :suburb, presence: true
    validates :street, presence: true
    validates :street_no, presence: true
    validates :category, presence: true
    validates :price, presence: true
    validates :picture, presence: true
    
    
    #GEOCODING
    geocoded_by :full_address
    after_validation :geocode

    def full_address
        
        [street_no, street, suburb, state].compact.join(',')
      
    end
    
end
