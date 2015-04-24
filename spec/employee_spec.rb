require 'employee'

RSpec.describe Employee do
  describe "methods" do
    describe "#initialize" do
      context "employee details are all passed in as an array" do
        before do
          @employee = Employee.new(['David','Rudd','60050','9%',
            '01 March - 31 March'])
        end

        it "sets the employee's first name" do
          expect(@employee.first_name).to eq "David"
        end

        it "sets the employee's last name" do
          expect(@employee.last_name).to eq "Rudd"
        end

        it "sets the employee's annual salary as a float" do
          expect(@employee.annual_salary).to eq 60050.0
        end

        it "sets the employee's super rate as a float" do
          expect(@employee.super_rate).to eq 9.0
        end

        it "sets the employee's pay period" do
          expect(@employee.pay_period).to eq "01 March - 31 March"
        end
      end
    end
  end
end
