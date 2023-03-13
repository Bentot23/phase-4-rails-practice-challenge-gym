class MembershipsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    def destroy
        membership = Membership.find(params[:id])
        membership.destroy
        head :no_content
    end

    private

    def membership_params
        params.permit( :gym_id, :client_id, :charge )
    end

    def not_found
        render json: {"error": "Membership not found"}, status: 404
    end

    def invalid
        render json: {"errors": ["validation errors"]}, status: 422
    end
end
