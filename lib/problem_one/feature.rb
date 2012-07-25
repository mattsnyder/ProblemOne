module ProblemOne
  class Feature
    def initialize(title, date_range, price)
    end

    def self.null
      @@null ||= NullFeature.new
      @@null
    end

    class NullFeature

    end
  end
end
