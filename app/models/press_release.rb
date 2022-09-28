class PressRelease < ApplicationRecord
  # polymorphic associations
  has_many :documents, as: :documentable
end
