require 'payslip'

RSpec.describe Payslip do
  describe "methods" do
    before do
      employee = Employee.new(['David','Rudd','60050','9%',
        '01 March – 31 March'])
      @payslip = Payslip.new employee
    end

    describe "#name" do
      context "the employee has a first and a last name" do
        it "returns the employee's first and last name" do
          @payslip.employee.first_name = "John"
          @payslip.employee.last_name = "Smith"
          expect(@payslip.name).to eq "John Smith"
        end
      end
    end

    describe "#pay_period" do
      context "the employee has a pay period" do
        it "returns the employee's pay period" do
          @payslip.employee.pay_period = "01 March - 31 March"
          expect(@payslip.pay_period).to eq "01 March - 31 March"
        end
      end
    end

    describe "#gross_income" do
      context "the employee has an annual salary" do
        it "returns one twelfth of the employee's annual salary" do
          @payslip.employee.annual_salary = 120000
          expect(@payslip.gross_income).to eq 10000
        end
      end
    end

    describe "#income_tax" do
      context "the employee's annual salary is between $0 and $18200" do
        it "returns no income tax" do
          @payslip.employee.annual_salary = 18200
          expect(@payslip.income_tax).to eq 0
        end
      end

      context "the employee's annual salary is between $18201 and $37000" do
        it "returns income tax of 19c for each $1 over $18,200, divided by 12
          and rounded to the dollar" do
          @payslip.employee.annual_salary = 37000
          expect(@payslip.income_tax).to eq 298
        end
      end

      context "the employee's annual salary is between $37,001 - $80,000" do
        it "returns income tax of $3,572 plus 32.5c for each $1 over $37,000,
          divided by 12 and rounded to the dollar" do
          @payslip.employee.annual_salary = 80000
          expect(@payslip.income_tax).to eq 1462
        end
      end

      context "the employee's annual salary is between $80001 and $180000" do
        it "returns income tax of $17,547 plus 37c for each $1 over $80,000,
          divided by 12 and rounded to the dollar" do
          @payslip.employee.annual_salary = 180000
          expect(@payslip.income_tax).to eq 4546
        end
      end

      context "the employee's annual salary is over $180000" do
        it "returns income tax of $54,547 plus 45c for each $1 over $180,000,
          divided by 12 and rounded to the dollar" do
          @payslip.employee.annual_salary = 1000000
          expect(@payslip.income_tax).to eq 35296
        end
      end
    end

    describe "#net_income" do
      it "returns the employee's gross income, minus the income tax, rounded to
        the dollar" do
        @payslip.employee.annual_salary = 120000
        expect(@payslip.net_income).to eq 7304
      end
    end

    describe "#super" do
      it "returns the employee's gross income multiplied by the employee's
        super percentage, rounded to the dollar" do
        @payslip.employee.annual_salary = 120000
        @payslip.employee.super_rate = 9.0
        expect(@payslip.super).to eq 900
      end
    end
  end
end
