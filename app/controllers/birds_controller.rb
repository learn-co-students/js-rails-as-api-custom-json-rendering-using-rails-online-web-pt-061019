class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: Bird
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    # just if we wanna render just this piece of data and not everything.
    # or we can use this too: render json: bird.slice(:id, :name, :species)
    render json: birds, only: [:id, :name, :species]
    # we use this method above to work with arrays of hashes!
    # or we can do it this way with exceptions to create the same result:
    # render json: birds, except: [:created_at, :updated_at]
    #   bird = Bird.find_by(id: params[:id])
    # if bird
    #   render json: { id: bird.id, name: bird.name, species: bird.species }
    # else
    #   render json: { message: 'Bird not found' }
    # end
  end
end
