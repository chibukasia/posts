class ApplicationController < ActionController::API
    include ActionController::Cookies 
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response 
    before_action :authorize
    

    def invalid_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    private 
    def authorize 
        render json: {error: "Login or signup to continue"}, status: :unauthorized unless session.include? :user_id
    end
end
