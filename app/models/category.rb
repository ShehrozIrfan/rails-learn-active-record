class Category < ApplicationRecord
  has_many :products

  def prefix
    "GEN"
  end
end
