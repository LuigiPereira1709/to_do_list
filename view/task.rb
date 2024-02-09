require_relative '../controller/task.rb'
require 'json'

class Task
  class << self
    def task_index(task_choose)
      json_file = Task.read_json
      task_index = json_file['tasklist'].find_index { |task| task.keys.first == task_choose }
      json_file['tasklist'][task_index][task_choose].each { |keys, values| puts "#{keys} - #{values}" }
    end

    def all_tasks
      cont = 0
      json_file = Task.read_json
      json_file['tasklist'].each { |task| print "#{cont += 1}- "; task.keys.each { |key| puts key } }
    end


  end
end
