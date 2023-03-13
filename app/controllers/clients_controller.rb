class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        client = Client.all
        render json: client, status: :ok
    end

    def show
        client = Client.find(params[:id])
        render json: client, serializer: ClientMembershipSerializer, status: :ok
    end

    

    private

    def not_found
        render json: {"error": "Gym not found"}, status: 404
    end

    def invalid
        render json: {"errors": ["validation errors"]}, status: 422
    end
end
