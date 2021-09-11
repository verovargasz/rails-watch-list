class ListsController < ApplicationController
  before_action :find_list, only: %i[show edit update]

  def index
    @lists = List.all
  end

  def new
    @list = List.new # needed to instantiate the form_for
  end

  def create
    @list = List.new(list_params)
    @list.save

    # no need for app/views/lists/create.html.erb
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit; end

  def update
    @list.update(list_params)

    redirect_to list_path(@list)
  end

  def show; end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
