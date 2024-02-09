require '../slow.rb'

class Task
  class << self
    def valid_name?(name)
      name = verification_input_empty(name)
      name.length < 25 && !name.nil?
    end

    def valid_description?(description)
      verification_input_empty(description)
    end

    def valid_deadline?(deadline)
      deadline = verification_input_empty(deadline)
      !deadline.nil? && valid_date_format?(deadline, "%Y-%m-%d")
    end

    def valid_task_choose?(task_choose)
      task_choose = verification_input_empty(task_choose)
      Numeric(task_choose) && !task_choose.nil?
    end

    def valid_field_choose?(field_choose)
      field_choose = verification_input_empty(field_choose)
      Numeric(field_choose) && !field_choose.nil?
    end

    def valid_content?(content)
      verification_input_empty(content)
    end

    private

    def valid_date_format?(date,  format)
      begin
        Date.strptime(date, format)
        true
      rescue ArgumentError
        false
      end
    end

    def verification_input_empty(params)
      user_input = params.strip
      !user_input.empty?
    end
  end
end
