class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(costomer_params)
      redirect_to public_customer_path(current_customer)
    else
      render:edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :address, :telephone_number)
  end
end
