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
  end

  context "with bad features" do
    Given (:bill) { ProblemOne::Bill.new }
    When { bill.features << ProblemOne::Feature.null }
    Then { bill.should_not be_valid }
    Then { bill.should_not be_empty }
    Then { bill.should have(1).features }
  end

end
