class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    @lists = List.all
  end

  def show
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect to @list
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
