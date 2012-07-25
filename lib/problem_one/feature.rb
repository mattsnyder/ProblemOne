module ProblemOne
  class Feature
    attr_accessor :title, :date_range, :price
    def initialize(title, date_range, price)
      @title = title
      @date_range = date_range
      @price = price.to_f
    end

    def self.null
      @@null ||= NullFeature.new
      @@null
    end

    class NullFeature
      def nil?; true; end
      def title; ""; end
      def date_range; ""; end
      def price; 0; end
    end
  end
end
