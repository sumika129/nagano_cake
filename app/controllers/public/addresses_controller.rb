class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new
    if @address.save(address_params)
      redirect_to public_addresses_path(@address.id)
    else
      render:index
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path(current_customer)
    else
      render:edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
