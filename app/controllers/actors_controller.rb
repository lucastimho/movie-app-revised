class ActorsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except [:index, :show]
  def index
    render json: Actor.all
  end
  def show
    q = params["id"]
    render json: Actor.find_by(id: q)
  end
  def create
    actor = Actor.new(
    first_name: params["first_name"],
    last_name: params["last_name"],
    known_for: params["known_for"],
    age: params["age"],
    gender: params["gender"]
    )
    if actor.save
      render json: actor
    else
      render json: {error: actor.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    actor = Actor.find_by(id: params[:id])
    actor.first_name = params["first_name"] || actor.first_name
    actor.last_name = params["last_name"] || actor.last_name
    actor.known_for = params["known_for"] || actor.known_for
    actor.age = params["age"] || actor.age
    actor.gender = params["gender"] || actor.gender
    if actor.save
      render json: actor
    else 
      render json: {error: actor.errors.full_messages}, status: 418
    end
  end
  def destroy
    q = params["id"]
    Actor.destroy_by(id: q)
  end
end
