class BirdsController < ApplicationController

  # POST /birds
  def create
    bird = Bird.create(name: params[:name], species: params[:species])
  render json: bird, status: :created
  end
# PATCH /birds/:id
def update
  bird = Bird.find_by(id: params[:id])
  if bird
    bird.update(bird_params)
    render json: bird
  else
    render json: { error: "Bird not found" }, status: :not_found
  end
end
def bird_params
  params.permit(:name, :species, :likes)
end
def increment_likes
  bird = Bird.find_by(id: params[:id])
  if bird
    bird.update(likes: bird.likes + 1)
    render json: bird
  else
    render json: { error: "Bird not found" }, status: :not_found
  end
end
end