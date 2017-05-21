module API
  module V1
    class Root < Grape::API
    	# error_formatter :json, API::V1::ErrorFormatter
    	
      mount API::V1::Posts
      # mount API::V1::Authors
    end
  end
end