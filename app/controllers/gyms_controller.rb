class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        gym = Gym.all
        render json: gym, status: :ok
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    # def create
    #     gym = Gym.create!(gym_params)
    #     render json: gym, status: :created
    # end

    def update
        gym = Gym.find(params[:id])
        gym.update!(gym_params)
        render json: gym, status: :ok
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def not_found
        render json: {"error": "Gym not found"}, status: 404
    end
    def invalid
        render json: {"errors": ["validation errors"]}, status: 422
    end
end
