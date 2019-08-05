require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    session_cookie = req.cookies['_rails_lite_app'] #json obj
    if session_cookie 
      @rails_cookie = JSON.parse(session_cookie)  #ruby hash
    else
      @rails_cookie = {}
    end

  end
# expect(session['xyz']).to eq('abc')
  def [](key)
    @rails_cookie[key]
  end

  def []=(key, val)
    @rails_cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    value = @rails_cookie.to_json
    hash = { path: "/" , value: value }
    res.set_cookie(:_rails_lite_app, hash) #response obj with hash { path: "", value: json obj }
  end
end
