class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def destroy
    @list.destroy
    flash[:alert] = "List has been successfully deleted"
    redirect_to lists_path, status: :see_other
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      flash[:alert] = "The list was not created"
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
