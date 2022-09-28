=begin

*** === POLYMORPHIC ASSOCIATIONS === ***

- It is used when a model belongs to several other models.
- Only works with belongs_to
- Has similar data structure and model code(unlike the sti, which has similar data structure but can have over-ridden model code)
- Example, let say we've a document model(pdf) and we've a model Product that has many documents, and we also have a PressRelease model that can also have many documents.

    class Document < ActiveRecord::Base
      belongs_to :product
      # belongs_to :press_release
    end

    class Product < ActiveRecord::Base
      has_many :documents
    end

    class PressRelease < ActiveRecord::Base
      has_many :documents
    end

So, if we've 10 other models having many documents then we've to add the 10 other foreign keys to document table and that will lead us to foreign key managment issue. So, to solve this, we can have one foreign key and that foreign key will store which object we're using at that time.

We need to use the polymorphic associations. It will create a virtual model and our Product and PressRelease models will call that virtual model.

    class Document < ActiveRecord::Base
      belongs_to :documentable, polymorphic: true
    end

    class Product < ActiveRecord::Base
      has_many :documents, as: :documentable
    end

    class PressRelease < ActiveRecord::Base
      has_many :documents, as: :documentable
    end

    #documentable is a virtual model

In the databse we need to add the documentable_id and documentable_type for managment. We can do this:

    t.references :documentable, polymorphic: true, index: true

The above command will add the documentable_id and documentable_type.


*** See the associations branch with polymorphic-associations commit for example and code.

=end
