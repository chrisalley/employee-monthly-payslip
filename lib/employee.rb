class Employee
  attr_accessor :first_name, :last_name, :annual_salary, :super_rate,
    :pay_period

  def initialize(employee_details)
    @first_name = employee_details[0]
    @last_name = employee_details[1]
    @annual_salary = employee_details[2].to_f
    @super_rate = employee_details[3].to_f
    @pay_period = employee_details[4]
  end
end
