class ApplicationController < ActionController::Base
    def 
        protect_from_forgery with: :null_session
    end 
end
