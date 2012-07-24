module ProblemOne
  class Feature

    def title
      "TXT MESSAGING - 250"
    end

    def date_range
      "09/29 - 10/28"
    end

    def price
      4.99
    end

    def to_json
      '{"feature":"TXT MESSAGING - 250","date_range":"09/29 - 10/28","price":4.99}'
    end
  end
end
