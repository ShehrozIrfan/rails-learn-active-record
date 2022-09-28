=begin

*** === SELF REFERENTIAL ASSOCIATIONS === ***

- It is a class with an association back to itself
- The classic example of this will be:
  Supervisor has subordinates.
  But the subordinates has also subordinates, so in this case subordinates are supervisors for their subordinates.
  As we know all the supervisors and subordinates are all employees with common attributes. So we've only one table named 'Employee' in database.

  class Employee < ActiveRecord::Base
    belongs_to :supervisor, class_name: 'Employee'

    has_many :subordinates, class_name: 'Employee', foreign_key: 'supervisor_id'

    # as supervisor and subordinates table doesn't exist so we need to provide the class name. As the class name is 'Employee' so these are self-referencing.
  end

  So, now we can use this:
  shehroz = Employee.find_by_name("Shehroz")
  shehroz.supervisor
  shehroz.subordinates

Another example for this can be the comments in a blog post. Every comment can have further comments or responses. And the commend can have parent as well.

=end
