class GymsController < ApplicationController
  def index
    gyms = Gym.all
    render json: gyms, status: :ok
  end

  def show
    gym = Gym.find_by(id: params[:id])

    if gym
      render json: gym, status: :ok
    else 
      render json:{ error:"Gym not found" }, status: :not_found
    end
  end

  def destroy
    gym = Gym.find_by(id: params[:id])

    if gym.nil?
      render json: {error: "Gym not found"}, status: :not_found
    else
      gym.destroy
      head :no_content
    end
  end

  def update
    gym = Gym.find_by(id: params[:id])

    if gym.nil?
      render json: {errors:"Gym not found"}, status: :not_found
    elsif gym.update(gym_params)
      render json: gym, status: :ok
    else
      render json: {errors: gym.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def gym_params
    params.permit(:name, :address)
  end
end
