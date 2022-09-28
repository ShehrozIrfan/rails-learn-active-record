class Document < ApplicationRecord
  # polymorphic associations
  belongs_to :documentable, polymorphic: true
end
