module API
	class Root < Grape::API
		prefix 'api'
    # error_formatter :json, API::ErrorFormatter
    
    mount API::V1::Root
    # mount API::V2::Root (next version)

    http_basic do |email, password|
    	user = User.find_by_email(email)
    	user && user.valid_password?(password)
    end
  end
end