require './view/task.rb'
require './controller/task.rb'



name = 'to-do list'
description = 'make a project of to-do list in ruby'
deadline = "don't have a deadline"

Task.new(name, description, deadline)
Task.create
puts Task.all_task
