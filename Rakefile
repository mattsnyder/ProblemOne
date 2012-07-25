require './lib/problem_one'

namespace :problem_one do
  desc "Read in a file and convert it to JSON"
  task :convert_bill_to_json, :file_path do |task, args|
    exit unless args[:file_path] && File.exist?(args[:file_path])

    parser = ProblemOne::BillParser.new
    bill = parser.parse(File.read(args[:file_path]))
    puts bill.to_json
  end
end
