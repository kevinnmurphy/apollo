class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash

  not_found do
    status 404
    erb :error
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

    def sanitize_input(params)
      params.each_with_object({}) do |(k, v), new|
        if v.is_a? String
          new[k] = v.gsub(/[\<\>\/]/, "")
        elsif v.is_a? Array
          sanitized_array = v.map! { |arr_v| arr_v.gsub(/[\<\>\/]/, "") }
          new[k] = sanitized_array
        else
          sanitized_hash = v.transform_values! { |hash_v| hash_v.gsub(/[\<\>\/]/, "") }
          new[k] = sanitized_hash
        end
      end
    end
    
  end

end