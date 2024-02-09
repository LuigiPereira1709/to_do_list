require 'json'

class Task
  attr_accessor :name, :description, :deadline
  def initialize(name, description, deadline)
    @name = name
    @description = description
    @deadline = deadline
  end

  class << self
    def create(name, description, deadline)
      date_saved = Time.now.strftime("%Y-%m-%d")
      task = Task.new(name, description, deadline)
      if post_task(:create, name, description, date_saved, deadline)
        puts "Task #{name} was successfully created."
      else
        puts "Task #{name} can't be created."
      end
    end

    def edit(task_choose, field_choose, content)
      post_task(:edit, task_choose, field_choose, content)
    end

    def delete(task)
      json_file = read_json['tasklist']
      delete_task = json_file.delete_at(task)
      save(json_file)
    end

    def read_json
      json_file = JSON.parse(File.read('./data.json'))
    end

    private
    def save(task)
        File.open("./data.json", "w") do |archive_json|
        archive_json.puts JSON.pretty_generate(task)
      end
    end

    def post_task(action, *arg)
      json_file = read_json

      case action
      when :create
        new_item = { arg[0] => { description: arg[1], initial_date: arg[2], deadline: arg[3] } }
        json_file['tasklist'] << new_item
      when :edit
        task_index = json_file['tasklist'].find_index { |task| task.keys.first == arg[0] }
        json_file['tasklist'][task_index][arg[0]][arg[1]] = arg[2]
      end

      save(json_file)
      puts json_file
      json_file
    end
  end
end
