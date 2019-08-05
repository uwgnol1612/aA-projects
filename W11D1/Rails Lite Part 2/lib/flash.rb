require 'json'

class Flash #< Hash
    attr_reader :flash

    def initialize(req)

        flash_cookie = req.cookies['_rails_lite_app_flash']

        if flash_cookie
            @flash_now = JSON.parse(flash_cookie)
        else 
            @flash_now = {}
        end 

        @flash = {}
        
        
    end

    def [](key)
        
        @flash_now[key.to_s] || @flash[key.to_s]

    end 
    
    def []=(key, value)
        
        @flash[key.to_s] = value
        
    end

    def store_flash(res)
        res.set_cookie('_rails_lite_app_flash', path: "/" , value: @flash.to_json)
    end 

    def now
        @flash_now
    end 

end
