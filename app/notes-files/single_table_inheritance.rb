=begin

*** === SINGLE TABLE INHERITANCE - STI === ***

- It has one table, like a self-referential association
- All objects have similar data structure(same column)
- Different classes allow for different behaviors
- Behavior can be inherited and over-ridden.

As we're using the single table, so to tell the rails which data is for which model, we need to add the type column to the table. And the rails is smart enough to know the type for the inherited model. And there is no additional configuration needed.

*** See the associations branch with single table inheritance commit for example and code.

=end
