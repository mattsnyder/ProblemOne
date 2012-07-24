require 'rspec'
require 'rspec/given'
require './lib/problem_one'

describe "parsing a feature from a string" do
  context "with a 4.99 txt messaging feature" do
    Given(:feature_string) { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99" }
    Then { converted(feature_string).should represent_a_feature_titled "TXT MESSAGING - 250" }
    Then { converted(feature_string).should represent_a_feature_for_date_range_of "09/29 - 10/28" }
    Then { converted(feature_string).should represent_a_feature_costing 4.99 }
  end


  def converted(string)
    ProblemOne::FeatureParser.parse string
  end

  RSpec::Matchers.define :represent_a_feature_costing do |expected|
    match do |actual|
      actual.price == expected
    end

    failure_message_for_should do
      "should cost '#{expected}', but costed '#{actual.cost}'"
    end

    failure_message_for_should_not do
      "should not cost '#{expected}', but was"
    end

    description do
      "have a cost of '#{expected}'"
    end
  end

  RSpec::Matchers.define :represent_a_feature_for_date_range_of do |expected|
    match do |actual|
      actual.date_range == expected
    end

    failure_message_for_should do
      "should for date range of '#{expected}', but was '#{actual.date_range}'"
    end

    failure_message_for_should_not do
      "should not for date range of '#{expected}', but was"
    end

    description do
      "have a date range of '#{expected}'"
    end
  end

  RSpec::Matchers.define :represent_a_feature_titled do |expected|
    match do |actual|
      actual.title == expected
    end

    failure_message_for_should do
      "should be titled '#{expected}', but was '#{actual.title}'"
    end

    failure_message_for_should_not do
      "should not be titled '#{expected}', but was"
    end

    description do
      "have a title of '#{expected}'"
    end
  end
end
