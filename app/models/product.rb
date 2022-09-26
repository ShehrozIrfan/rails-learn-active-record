class Product < ApplicationRecord
  belongs_to :category
  #Here I've defined the default scope that will always be applied on the product
  #If you don't want to apply default scope use Product.unscoped
  default_scope { order(created_at: :desc) }

  #Below is the named scope that will be called like: Product.recent
  scope :recent, lambda { where("created_at >= ?", 1.day.ago) }

  #Add the allow_nil: true, in case when there is no associated record exists, then we don't get an error
  delegate :prefix, to: :category, prefix: 'cat', allow_nil: true

  #The above delegate code is same as:
  # def prefix
  #  category.prefix
  # end

  #callbacks
  after_save :announce_saved

  def full_ref_num
    #as we've added the prefix true, so now we will use object_attribute: cat_prefix
    "#{cat_prefix}-#{ref_num}"
  end

  private
    def announce_saved
      puts "*** Saved! ***"
    end
end
