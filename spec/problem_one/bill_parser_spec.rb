require 'rspec'
require 'rspec/given'
require './lib/problem_one'

describe "parsing a text file with billing information" do
  Given (:parser) { ProblemOne::BillParser.new }

  describe "with nil input" do
    Given { parser.should_receive(:warn).with("Cannot parse nil into a Bill") }
    Then { parser.parse(nil).should be_empty }
  end

  describe "with an empty string" do
    Then { parser.parse("").should be_empty }
  end

  describe "with one row" do
    Given (:a_feature_string) { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99" }
    Given { ProblemOne::Feature.should_receive(:new).with("TXT MESSAGING - 250", "09/29 - 10/28", "4.99").once }
    Then { parser.parse(a_feature_string).should have(1).features }
  end

  describe "with two rows" do
    Given (:txt_feature_string) { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99" }
    Given (:data_feature_string) { "$24.98 UNLIMITED DATA 09/21 - 10/21 24.98" }
    Given { ProblemOne::Feature.should_receive(:new).with("TXT MESSAGING - 250", "09/29 - 10/28", "4.99").once }
    Given { ProblemOne::Feature.should_receive(:new).with("UNLIMITED DATA", "09/21 - 10/21", "24.98").once }
    Then { parser.parse([txt_feature_string, data_feature_string].join($/)).should have(2).features }
  end

end
