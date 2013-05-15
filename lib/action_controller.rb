require "filters"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action)
      public_send action
    end
  end

  class Base < Metal
    include Filters
  end
end