require './lib/problem_one/feature'

module ProblemOne
  class Bill
    attr_accessor :features

    def initialize
      self.features = []
    end

    def empty?
      true
    end

    def valid?
      false
    end
  end
end
