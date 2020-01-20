class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
        # slice works fine for a single hash, as with bird, it won't work for an array of hashes
        # we can add in the only: option directly after listing an object we want to render to JSON
    # render json: birds, only: [:id, :name, :species]
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
        # no more insance variable, since we're immediately rendering birds and bird to JSON and not using ERB

    # render json: {id: bird.id, name: bird.name, species: bird.species }
        # created a new hash out of three keys, assigning the keys manually with the attributes of bird

    # render json: bird.slice(:id, :name, :species)
        # Rather than having to spell out each key, the Hash slice method returns a new hash with only the keys that are passed into slice.
    
        # Error Messaging When Rendering JSON Data
      if bird
        render json: { id: bird.id, name: bird.name, species: bird.species }
      else
        render json: { message: 'Bird not found' }
      end
  end
end