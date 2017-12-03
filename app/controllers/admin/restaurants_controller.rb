class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, :only => [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create"
      render :new
    end
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurants_url
    else
      render  :action => :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end


end
