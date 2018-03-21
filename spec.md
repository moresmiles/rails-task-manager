# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  'User' has many lists, tasks, and groups
  'List' has many users, and tasks
  'Group' has many users, and group_users
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  'Tasks' belong to user and list
  'Group_User' belongs to group and user
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Two join table, Tasks and Group_Users
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  task.name
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Devise for all login related validations
  Upon instantiation Group and List validates the presence of a name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Task.incomplete URL: /application/index (application/incomplete_tasks_table)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  Form - lists/_form
  Custom Writer - list.rb
- [x] Include signup (how e.g. Devise)
  Devise
- [x] Include login (how e.g. Devise)
  Devise
- [x] Include logout (how e.g. Devise)
  Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  OmniAuth Google
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  groups/1/lists/1
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  groups/1/lists/1/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  groups/_form & lists/_form

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
  no helpers used
- [x] Views use partials if appropriate
  8 partials in total
