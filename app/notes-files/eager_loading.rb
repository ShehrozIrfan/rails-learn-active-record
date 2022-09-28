=begin

*** === EAGER LOADING === ****

Eager-loading or Pre-loading is a way of writing queries for loading associated records from the related tables.

Let suppose we've a model 'Product', and it has association with 'Category' as:

Category can have many Products
Product belongs to Category

So, let say we've Products and we want to store the category name for each product in the names array. We can do this using:

    names = []
    products = Product.all
    # SELECT * FROM products

    products.each do |pro|
        names << pro.category.name
    end

So, every time we go through the loop, and there is a category that we've not seen before we've to query from the database again in order to get that category information and name. But the rails is smart enough in the case we've found the category that we've seen before, the rails will have its value in hand for us. But when there is a category that've not seen before we've to query the database.

Let say we've 3 categories in the database that are new so we've to query the database 3 times in addition to the first query. so, the following queries will run:
# SELECT * FROM categories WHERE id = 2
# SELECT * FROM categories WHERE id = 1
# SELECT * FROM categories WHERE id = 3

so, in total we're making n + 1 queries, n = number of new categories + the original query(Product.all). So, its a problem, imagine we've 100 categories in the table we've to make 100 queries to the database to get the records in addition to the original query.


*** Solution - Eager Loading ***

Eager loading allows us to preload this related data by asking the database to include it when we make the original query, and we do that using includes.

    products = Product.includes(:category).all

    # SELECT * FROM products
    # SELECT * FROM categories WHERE id IN (1,2,3)

    products.each do |pro|
        names << pro.category.name
    end

So, when we use includes, firstly it get all the products and then grab all the id's of categories and make a second query to find all of those categories. So, this code will execute only two queries.

*** Using Joins in Eager Loading ***

The primary purpose of using eager loading is to preload the data, but sometimes we also want to join tables.

      products = Product.includes(:category).where(categories: { name: "Furniture" })
      # SELECT products.*, categories.* FROM products
        LEFT OUTER JOIN categories
        ON categories.id = products.category_id
        WHERE categories.name = 'Furniture'

So, when we use this hash syntax, the rails is smart enough to join the tables. But if we don't use the hash syntax and use the string statement then rails wouldn't recognize to use the joins, so it will start making two queries that will result in an error:

      Unknown column 'categories.name' in 'where' clause

      products = Product.includes(:category).where("categories.name = 'Furniture'")

The solution is to tell rails that we need to reference that other category:

      products = Product.includes(:category).where("categories.name = 'Furniture'").references(:category)

The above query will make rails to use joins.

=end
