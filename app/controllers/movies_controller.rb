class MoviesController < ApplicationController
  def index
    render json: Movie.all
  end
  def show
    q = params["id"]
    render json: Movie.find_by(id: q)
  end
  def create
    movie = Movie.new(
    title: params["title"],
    year: params["year"],
    plot: params["plot"],
    english: params["english"]
    )
    if movie.save
      render json: movie
    else
      render json: {error: movie.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    movie = Movie.find_by(id: params[:id])
    movie.title = params[:title] || movie.title
    movie.year = params[:year] || movie.year
    movie.plot = params[:plot] || movie.plot
    movie.director = params[:director] || movie.director
    movie.english = params[:english] || movie.english
    if movie.save
      render json: movie
    else 
      render json: {error: movie.errors.full_messages}, status: 418
    end
  end
  def destroy
    q = params["id"]
    Movie.destroy_by(id: q)
  end
end
