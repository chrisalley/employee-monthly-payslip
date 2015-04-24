require_relative 'employee'
require_relative 'payslip'

class PayslipDataGenerator
  attr_reader :input_csv_path, :output_csv_path

  def initialize(input_csv_path, output_csv_path)
    if input_csv_path
      @input_csv_path = input_csv_path
      @output_csv_path = output_csv_path if output_csv_path
      @output_csv_path = "output.csv" unless @output_csv_path
    else
      raise "Input CSV file not specified."
    end
    if output_csv_path
      @output_csv_path = output_csv_path
    else
      @output_csv_path = "output.csv"
    end
  end

  def generate
    File.write(@output_csv_path, payslip_csv)
  end

  private

  def payslip_csv
    require 'csv'
    payslip_csv = ""
    CSV.foreach(@input_csv_path) do |employee_details|
      employee = Employee.new employee_details
      payslip = Payslip.new employee
      payslip_details = [payslip.name, payslip.pay_period, payslip.gross_income,
        payslip.income_tax, payslip.net_income, payslip.super]
      payslip_csv << CSV.generate_line(payslip_details, {})
    end
    payslip_csv
  end
end
