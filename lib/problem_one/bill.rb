require './lib/problem_one/feature'

module ProblemOne
  class Bill
    attr_accessor :features

    def empty?
      features.empty? # If using rails, could use delegate :empty? => :features
    end

    def initialize
      self.features = []
    end

    def valid?
      features.index{|feature| feature.nil? }.nil?
    end

    def to_json(*a)
      features.to_json(*a)
    end
  end
end
