class Category < ApplicationRecord
  has_many :products

  validates :prefix, presence: true
  validates :name, presence: true

  before_validation :add_prefix

  private
    def add_prefix
      if prefix.blank?
        puts "*** Adding Prefix!"
        self.prefix = "GEN"
      end
    end
end
