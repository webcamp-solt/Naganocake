class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path "You have updated user successfully."
    else
      @genres = Genre.page(params[:page])
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
   @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path(@genres), notice: "You have updated user successfully."
    else
      render :edit
     end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
