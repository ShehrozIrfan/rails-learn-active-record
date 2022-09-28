class Product < ApplicationRecord
  # to create the counter cache we need to have a column in parent table like this: child_count, such as product_count. And then we need to add the counter_cache true to the child model.
  # the main difference between count and size is that, the count fires the sql query to fetch the result, while size doesn't because it has stored the count in the cache.
  belongs_to :category, counter_cache: true

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

  # polymorphic associations
  has_many :documents, as: :documentable

  def full_ref_num
    #as we've added the prefix true, so now we will use object_attribute: cat_prefix
    "#{cat_prefix}-#{ref_num}"
  end

  # STI - Single table inheritance
  def available_online
    true
  end

  def available_store
    true
  end

  private
    def announce_saved
      puts "*** Saved! ***"
    end
end
