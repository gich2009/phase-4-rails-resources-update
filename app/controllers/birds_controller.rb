class BirdsController < ApplicationController
  wrap_parameters format: []

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end


  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end


  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
  

  #POST /birds/:id
  def update
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(bird_params)
      render json: bird, status: :ok
    else
      render json: {error: "Bird not found"}, status: :not_found
    end
  end

  
  #For updating likes, check the .birds/likes_controller.rb file. 
  #I put it there to maintain RESTful actions in this controller by avoiding an action like 'increment_likes'


  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end
