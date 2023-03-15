class ApplicationController < ActionController::API

    # GET /
  def index
    

    render json: "Hello Munzambi"
  end
end
