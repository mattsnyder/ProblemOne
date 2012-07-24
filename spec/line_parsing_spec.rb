require 'rspec'
require 'rspec/given'
require 'json'
require './lib/problem_one/feature_parser'

describe "converting a string with feature data to JSON" do
  Then { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99".should convert_to_json_representing_values(
                                                                          {
                                                                            "feature" => "TXT MESSAGING - 250",
                                                                            "date_range" => "09/29 - 10/28",
                                                                            "price" => 4.99
                                                                          }) }
end

RSpec::Matchers.define :convert_to_json_representing_values do |expected|
  match do |actual|
    expected = JSON.generate expected
    ProblemOne::FeatureParser.parse(actual).to_json == expected
  end
  
  failure_message_for_should do
    "should have converted #{actual} to #{expected}"
  end
  
  failure_message_for_should_not do
    "should not have converted to #{expected}"
  end
  
  description do
    "convert string representation of a feature to a JSON representation"
  end
end
