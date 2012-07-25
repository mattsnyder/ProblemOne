require 'rspec'
require 'rspec/given'
require './lib/problem_one/feature'

describe "a feature" do

  context "with a title, date range, and a price" do
    Given(:feature) { ProblemOne::Feature.new "DATA PLAN", "01/01 - 02/02", "4.99" }
    Then { feature.title.should == "DATA PLAN" }
    Then { feature.date_range.should == "01/01 - 02/02" }
    Then { feature.price.should == 4.99 }
    Then { feature.should_not be_nil }

    describe "represented as JSON" do
      When (:json) { feature.to_json }
      Then { json.should == "{\"feature\":\"DATA PLAN\",\"date_range\":\"01/01 - 02/02\",\"price\":4.99}" }
    end
  end

  context "with a null feature" do
    Given(:feature) { ProblemOne::Feature.null }
    Then { feature.title.should == "" }
    Then { feature.date_range.should == "" }
    Then { feature.price.should == 0 }
    Then { feature.should be_nil }
    describe "represented as JSON" do
      When (:json) { feature.to_json }
      Then { json.should == "{\"feature\":\"\",\"date_range\":\"\",\"price\":0}" }
    end
  end



end
