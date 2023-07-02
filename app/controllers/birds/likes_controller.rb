class Birds::LikesController < ApplicationController

  def update
    bird = Bird.find_by(id: params[:id])
    if bird
      #check if the likes are nil or they are a number.
      if bird.likes
        bird.update(likes: bird.likes + 1)
      else
        bird.update(likes: 1)
      end
      render json: bird, status: :ok
    else
      render json: {error: "Bird not found"}, status: :not_found
    end
  end

end
