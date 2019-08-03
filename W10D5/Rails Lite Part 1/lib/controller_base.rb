require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

require 'rack'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params)
    @req = req
    @res = res 
    @params = params
    @already_built_response = false 
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    @res.status = 302
    @res.set_header('location',"#{url}")
    @already_built_response? raise : @already_built_response = true

    @session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    @res['Content-Type'] = content_type
    @res.write(content)
    @already_built_response? raise : @already_built_response = true

    @session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)

    path = File.join("views", "#{self.class.name.underscore}", "#{template_name}.html.erb")
    contents = File.read(path)
    content = ERB.new(contents).result(binding)
    render_content(content, 'text/html')
 
    # path_name = File.dirname(__FILE__) 
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(action_name)
    self.send(action_name)
    # render(action_name)
  end
end


