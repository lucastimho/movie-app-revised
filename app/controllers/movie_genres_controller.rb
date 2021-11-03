class MovieGenresController < ApplicationController
  def create
    moviegenre = MovieGenre.new(
      movie_id: params[:movie_id],
      genre_id: params[:genre_id]
    )
    moviegenre.save
    render json: moviegenre
  end
end
