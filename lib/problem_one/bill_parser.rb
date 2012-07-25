require './lib/problem_one/bill'

module ProblemOne
  class BillParser
    FEATURE_REGEXP = /^\$[0-9]+\.[0-9]{2} ([A-Z0-9\- ]+) ([0-9]{2}\/[0-9]{2} - [0-9]{2}\/[0-9]{2}) ([0-9]+\.[0-9]{2})$/
    def parse(bill_text)
      bill = ProblemOne::Bill.new
      bill_text.split($/).each do |feature_string|
        bill.features << convert_to_feature(feature_string.strip)
      end

      bill
    rescue NoMethodError
      warn "Cannot parse nil into a Bill"
      return Bill.new
    end

    def convert_to_feature(feature_string)
      Feature.new *(feature_string.match(FEATURE_REGEXP).values_at(1..3))
    rescue
      warn "Bad feature data: #{feature_string}"
      Feature.null
    end
    private :convert_to_feature
  end
end
