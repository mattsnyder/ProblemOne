require 'rspec'
require 'rspec/given'
require './lib/problem_one/bill'

describe "a bill" do

  context "with no features" do
    Given (:bill) { ProblemOne::Bill.new }
    Then { bill.should have(0).features }
    Then { bill.should be_valid }
    Then { bill.should be_empty }
  end

  context "with good features" do
    Given (:bill) { ProblemOne::Bill.new }
    Given (:good_feature) { ProblemOne::Feature.new "TXT PLAN", "01/01 - 02/02", "4.99" }
    When { bill.features << good_feature }
    Then { bill.should be_valid }
    Then { bill.should_not be_empty }
    Then { bill.should have(1).features }

    describe "represented as JSON" do
      Given { good_feature.stub(:to_json).and_return("{\"myfeature\":\"info\"}") }
      When (:json) { bill.to_json }
      Then { json.should == "[{\"myfeature\":\"info\"}]" }
    end
  end

  context "with bad features" do
    Given (:bill) { ProblemOne::Bill.new }
    When { bill.features << ProblemOne::Feature.null }
    Then { bill.should_not be_valid }
    Then { bill.should_not be_empty }
    Then { bill.should have(1).features }
  end

end
