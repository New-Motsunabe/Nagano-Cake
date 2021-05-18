class Admin::GenresController < ApplicationController

  def index

  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "登録されました"
      redirect_to admin_genres_path
    else
      @genres = Genres.all
      render :index and return
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
        @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to admin_genres_path
    else
      render :edit and return
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

end
