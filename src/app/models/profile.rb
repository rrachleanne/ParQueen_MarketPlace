class Profile < ApplicationRecord
  #profile belongs to user
  belongs_to :user
  #PRODUCT: self ref has many products with different foreign keys- class name product| dependent: :destroy to delete any products that relate to vendor after they delete their profile
  has_many :products_to_purchase, class_name: "Product", foreign_key: "customer_id"
  has_many :products_to_sell, class_name: "Product", foreign_key: "vendor_id", dependent: :destroy
  has_one_attached :picture

   #ensuring the correct image is uploaded
   validate :correct_picture_mime_type

   private
   def correct_picture_mime_type
       if picture.attached? && !picture.content_type.in?(%w(image/png image/jpeg image/jpg image/gif))
           errors.add(:picture, 'must be a: png, gif, jpeg or jpg file type')
       end
   end
  
  # To ensure data is collected in profile FORM
  validates :picture, presence: true
  validates :name, presence: true
  validates :phone, presence: true


end
