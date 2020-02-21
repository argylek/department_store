class ItemsController < ApplicationController
  before_action :set_department

  def index
    @items = @department.items
  end

  def new
    @item = @items.new
  end

  def create
    @item = @department.items.new(items_params)
    if @item.save
      redirect_to department_items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    render partial: 'form'
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to [@department, @item]
  end

  def new
    @item = @department.items.new
  end

  def update
    @item = Item.find(params[:id])
    if (@item.update(items_params))
      redirect_to [@department, @item]
      # redirect_to sub_item_path(@sub, @item)
    else
      render :new
    end
  end

  private
  def set_department
    @department = Department.find(params[:department_id])
  end
  def items_params
    params.require(:item).permit(:name, :description)
  end

end
