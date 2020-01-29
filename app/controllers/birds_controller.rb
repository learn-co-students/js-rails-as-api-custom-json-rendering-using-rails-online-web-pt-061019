class BirdsController < ApplicationController
  def index
    # @birds = Bird.all
    # render json: @birds
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at] # Same result as line 6 above

    # What's happening under the hood
    # def index
    #   birds = Bird.all
    #   render json: birds.to_json(except: [:created_at, :updated_at])
    # end
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # Error messaging
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found '}
    end
  end
end