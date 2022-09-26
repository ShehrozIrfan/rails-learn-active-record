class Product < ApplicationRecord
  belongs_to :category
  #Here I've defined the default scope that will always be applied on the product
  #If you don't want to apply default scope use Product.unscoped
  default_scope { order(created_at: :desc) }

  #Below is the named scope that will be called like: Product.recent
  scope :recent, lambda { where("created_at >= ?", 1.day.ago) }
end
