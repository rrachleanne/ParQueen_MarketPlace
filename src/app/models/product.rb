class Product < ApplicationRecord
    belongs_to :customer, class_name: "Profile", optional: true
    belongs_to :vendor, class_name: "Profile"
    has_one_attached :picture

end
