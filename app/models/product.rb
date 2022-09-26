class Product < ApplicationRecord
  belongs_to :category
  #Here I've defined the default scope that will always be applied on the product
  #If you don't want to apply default scope use Product.unscoped
  default_scope { order(created_at: :desc) }

  #Below is the named scope that will be called like: Product.recent
  scope :recent, lambda { where("created_at >= ?", 1.day.ago) }

  #Delegate allow a request for an object’s attribute to be delegated or referred to another object.
  #The delegate works in a way that the child ask it's parent for the attribute.
  delegate :prefix, to: :category

  #The above delegate code is same as:
  # def prefix
  #  category.prefix
  # end
end
