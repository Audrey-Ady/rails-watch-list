class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def new
    @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content)
  end
end
