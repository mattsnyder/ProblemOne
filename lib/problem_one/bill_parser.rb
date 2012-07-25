require './lib/problem_one/bill'

module ProblemOne
  class BillParser
    FEATURE_REGEXP = /^\$[0-9]+\.[0-9]{2} ([A-Z0-9\- ]+) ([0-9]{2}\/[0-9]{2} - [0-9]{2}\/[0-9]{2}) ([0-9]+\.[0-9]{2})$/
    def parse(text)
      bill = ProblemOne::Bill.new
      text.split($/).each do |row|
        bill.features << Feature.new(*feature_values(row))
      end

    rescue NoMethodError
      warn("Cannot parse nil into a Bill")
      return Bill.new
    end

    def feature_values(feature_string)
      feature_string.match(FEATURE_REGEXP).values_at(1..3)
    end
    private :feature_values
  end
end
