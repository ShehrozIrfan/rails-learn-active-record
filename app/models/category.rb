class Category < ApplicationRecord
  # adding the query to association - remember it will only be called when there is a call to category.products, it will not called when the model is loaded
  # as we've default scope present in product.rb
  # which will apply the order to DESC
  # we can undo that by:
  # 1. lambda { unscope(:order).order(:created_at) } OR
  # 2. lamda { reorder(:created_at) } - it will reorder it

  # has_many :products, lambda { reorder(:created_at) }

  # we can also add where and other queries in association like:
  has_many :products, lambda { where("qty_sold > 1") }

  # we can also add queries to same association with different class name

  has_many :products_available, lambda { where("inventory > 0") }, class_name: 'Product'


  validates :prefix, presence: true
  validates :name, presence: true

  before_validation :add_prefix, if: :missing_prefix
  #the around_save benchmark is defined in the application_record.rb file
  around_save :benchmark

  private

    def missing_prefix
      prefix.blank?
    end

    def add_prefix
      puts "*** Adding Prefix!"
      self.prefix = "GEN"
    end
end
