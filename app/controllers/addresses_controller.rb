class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @location.addresses
  end

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def edit
  end

  def create
    @address = @location.addresses.new(address_params)
    if @address.save
      redirect_to location_addresses_path(@location)
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to [@location, @address]
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to location_addresses_path
  end

  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street, :city, :state, :zip)
    end
end
