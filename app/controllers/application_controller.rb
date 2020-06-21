class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    # make hidden session eith env gem
    set :session_secret, "supersecret"
    # set :session_secret, "#{ENV['SESSION_SECRET']}"
  end

  get "/" do
    #erb :index
    if logged_in?
      erb :'users/index'
    else
      erb :'index'
    end
  end


  helpers do
		def logged_in?
			!!current_user
		end

		def current_user #momoization, caching
			@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  	end

    def login_required
      if !logged_in?
        flash[:alerts] = ["Please log in."]
        redirect to "/"
      end
    end

    def logout
      session.clear
    end

    #sanitize on patch and post
    def sanitize_input(input)
      input.transform_values! {|v| v.gsub(/[\<\>\/]/, "") }
    end
  end

end