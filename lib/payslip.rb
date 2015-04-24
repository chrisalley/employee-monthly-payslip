require_relative 'employee'

class Payslip
  attr_accessor :employee

  def initialize(employee)
    @employee = employee
  end

  def name
    "#{@employee.first_name} #{@employee.last_name}"
  end

  def pay_period
    "#{@employee.pay_period}"
  end

  def gross_income
    (@employee.annual_salary / 12).round
  end

  def income_tax
    case @employee.annual_salary
    when 0..18200
      tax = 0
    when 18201..37000
      tax = ((@employee.annual_salary - 18200) * 0.19) / 12
    when 37001..80000
      tax = (3572 + (@employee.annual_salary - 37000) * 0.325) / 12
    when 80001..180000
      tax = (17547 + (@employee.annual_salary - 80000) * 0.37) / 12
    else
      if @employee.annual_salary > 180000
        tax = (54547 + (@employee.annual_salary - 180000) * 0.45) / 12
      end
    end
    tax.round
  end

  def net_income
    (gross_income - income_tax).round
  end

  def super
    (gross_income * (@employee.super_rate / 100)).round
  end
end
