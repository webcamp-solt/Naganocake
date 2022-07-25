class Public::SearchsController < ApplicationController

  def search
    @content = params[:content]
    @range = params[:range]
    @genre_search = params[:genre_search]
    @items = Item.where("name LIKE ?", "%#{params[:content]}%")


    # if @range == '1'
    #   @items = Item.where("name LIKE ?", "%#{params[:content]}%")
    #   if @genre_search != nil
    #     @genre = Genre.find_by(id: @genre_search)
    #     @items_s = @items.where(genre_id: @genre_search)
    #   end
    # else
    #   @items = Item.all
    #   if @genre_search != nil
    #     @genre = Genre.find_by(id: @genre_search)
    #     @items_s = @items.where(genre_id: @genre_search)
    #   end
    # end
  end
end
