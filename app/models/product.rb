class Product < ApplicationRecord
  belongs_to :category
  #Here I've defined the default scope that will always be applied on the product
  #If you don't want to apply default scope use Product.unscoped
  default_scope { order(created_at: :desc) }

  #Below is the named scope that will be called like: Product.recent
  scope :recent, lambda { where("created_at >= ?", 1.day.ago) }

  #we can also set the prefix name of our choice
  delegate :prefix, to: :category, prefix: 'cat'

  #The above delegate code is same as:
  # def prefix
  #  category.prefix
  # end

  def full_ref_num
    #as we've added the prefix true, so now we will use object_attribute: cat_prefix
    "#{cat_prefix}-#{ref_num}"
  end
end
