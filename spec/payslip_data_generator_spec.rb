require 'payslip_data_generator'

RSpec.describe PayslipDataGenerator do
  describe "methods" do
    describe "#generate" do
      context "an output csv file is specified" do
        it "writes the payslip csv to the specified output file, matching the
          contents of the sample output file" do
          payslip_data_generator = PayslipDataGenerator.new(
            'sample_files/input.csv', 'output_test.csv')
          payslip_data_generator.generate
          expect(IO.read('output_test.csv')).to eq(
            IO.read('sample_files/output.csv'))
        end
      end

      context "an output csv file is not specified" do
        it "writes the payslip csv to the default output.csv file, matching the
          contents of the sample output file" do
          payslip_data_generator = PayslipDataGenerator.new(
            'sample_files/input.csv', nil)
          payslip_data_generator.generate
          expect(IO.read('output.csv')).to eq IO.read('sample_files/output.csv')
        end
      end
    end
  end
end
