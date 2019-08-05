class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern, @http_method, @controller_class, @action_name = 
      pattern, http_method, controller_class, action_name
  end

  # checks if pattern matches path and method matches request method
  def matches?(req)
    req.path =~ @pattern && req.request_method.downcase == @http_method.to_s
  end

  # use pattern to pull out route params (save for later?)
  # instantiate controller and call controller action
  def run(req, res)
    router_params = {}
    keys = @pattern.match(req.path).names
    keys.each do |key|
      router_params[key] = @pattern.match(req.path)[key]
    end 
    controller = self.controller_class.new(req, res, router_params)
    controller.invoke_action(@action_name)
    # match_data[:pattern]
    # MatchData
  end
end

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  # simply adds a new route to the list of routes
  def add_route(pattern, method, controller_class, action_name)
    route = Route.new(pattern, method, controller_class, action_name)
    @routes << route
  end

  # evaluate the proc in the context of the instance
  # for syntactic sugar :)

  def draw(&proc)
    self.instance_eval(&proc)
  end 



  [:get, :post, :put, :delete].each do |http_method|
    define_method http_method do |pattern, controller_class, action_name|
      add_route(pattern, http_method, controller_class, action_name)
    end
  end

  # should return the route that matches this request
  def match(req)
    @routes.each do |route|
      return route if route.matches?(req)
    end
    nil
  end

  # either throw 404 or call run on a matched route
  def run(req, res)
    if match(req)
      match(req).run(req, res)
    else 
      res.status = 404
    end 
    
  end
end
