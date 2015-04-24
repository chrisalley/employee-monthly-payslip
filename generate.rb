#!/usr/bin/env ruby

require_relative 'lib/payslip_data_generator'
payslip_data_generator = PayslipDataGenerator.new(ARGV[0], ARGV[1])
payslip_data_generator.generate
