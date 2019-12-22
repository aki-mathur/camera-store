class Category < ApplicationRecord
  # model association
  has_many :products, dependent: :destroy

  # validations
  validates_presence_of :name, :category_type, :model
end
