require "filters"
require "rendering"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action)
      public_send action
    end
  end

  class Base < Metal
    include Filters, Rendering
  end
end