class ClientsController < ApplicationController
  def index
    clients = Client.all 
    render json: clients, status: :ok
  end

  def show
    client = Client.find_by(id: params[:id])
    total_amount = client.memberships.sum(:charge)
    render json: {client:client, total_amount: total_amount}, status: :ok
  end

  def update
    client = Client.find_by(id: params[:id])

    if client.nil?
      render json: {errors:"Client not found"}, status: :not_found
    elsif client.update(client_params)
      render json: client, status: :ok
    else
      render json: {errors: client.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.permit(:name, :age)
  end
end
