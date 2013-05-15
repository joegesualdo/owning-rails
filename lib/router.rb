class Router
  def initialize(&block)
    @routes = {} # '/' => ['home', 'index']
    instance_eval(&block)
  end

  def match(routes)
    # { '/' => 'home#index', ... }
    routes.each_pair do |path, route|
      @routes[path] = route.split('#') # ['home', 'index']
    end
  end

  def recognize(path)
    @routes[path]
  end
end