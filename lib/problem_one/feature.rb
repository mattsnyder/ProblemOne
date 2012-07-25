module ProblemOne
  class Feature
    def initialize(title, date_range, price)
    end

    def self.null
      @@null ||= NullFeature.new
      @@null
    end

    class NullFeature
      def nil?; true; end
    end
  end
end
