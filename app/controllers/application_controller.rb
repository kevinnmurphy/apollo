class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash

  before do
  end

  not_found do
    status 404
    erb :oops
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "#{ENV['SESSION_SECRET']}"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      flash[:alerts] = ["Please login."]
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

    #sanitize on patch and post
    def sanitize_input(input)
      input.transform_values! {|v| v.gsub(/[\<\>\/]/, "") }
    end
  end

end