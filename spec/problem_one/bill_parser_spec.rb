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
    When (:bill) { parser.parse("") }
    Then { bill.should be_a ProblemOne::Bill }
    Then { bill.should be_empty }
  end

  describe "with one good row" do
    Given (:a_feature_string) { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99" }
    Given { ProblemOne::Feature.should_receive(:new).with("TXT MESSAGING - 250", "09/29 - 10/28", "4.99").once }
    Then { parser.parse(a_feature_string).should have(1).features }
  end

  describe "with a row containing extra whitespace" do
    Given (:a_feature_string) { " $4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99 " }
    Given { ProblemOne::Feature.should_receive(:new).with("TXT MESSAGING - 250", "09/29 - 10/28", "4.99").once }
    Then { parser.parse(a_feature_string).should have(1).features }
  end

  describe "with two good rows" do
    Given (:txt_feature_string) { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99" }
    Given (:data_feature_string) { "$24.98 UNLIMITED DATA 09/21 - 10/21 24.98" }
    Given { ProblemOne::Feature.should_receive(:new).with("TXT MESSAGING - 250", "09/29 - 10/28", "4.99").once }
    Given { ProblemOne::Feature.should_receive(:new).with("UNLIMITED DATA", "09/21 - 10/21", "24.98").once }
    Then { parser.parse([txt_feature_string, data_feature_string].join($/)).should have(2).features }
  end

  describe "with a bad row" do
    Given (:txt_feature_string) { "$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99" }
    Given (:bad_feature_string) { "$24.98 UNLIMITED DATA 09/2 - 10/21 24.99x" }
    Given { parser.should_receive(:warn).with("Bad feature data: #{bad_feature_string}").once }
    Given { ProblemOne::Feature.should_receive(:new).with("TXT MESSAGING - 250", "09/29 - 10/28", "4.99").once }
    When (:bill) { parser.parse([txt_feature_string, bad_feature_string].join($/)) }
    Then { bill.should_not be_valid }
    Then { bill.should have(2).features }
    Then { bill.features.should include(ProblemOne::Feature.null) }
  end

end
