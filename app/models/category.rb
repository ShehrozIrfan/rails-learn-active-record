class Category < ApplicationRecord
  has_many :products

  validates :prefix, presence: true
  validates :name, presence: true

  before_validation :add_prefix, if: :missing_prefix

  private

    def missing_prefix
      prefix.blank?
    end

    def add_prefix
      puts "*** Adding Prefix!"
      self.prefix = "GEN"
    end
end
