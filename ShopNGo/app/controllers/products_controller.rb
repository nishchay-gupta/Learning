class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    puts params
    
    if params[:product][:accept_terms] == "1"
      if @product.save
        redirect_to products_path, notice: "Product created successfully!"
      else
        flash.now[:alert] = "Please fill in all fields."
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "You must accept the terms!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :description, :available, :category, :accept_terms, :search, :range, :date, :time, :datetime, :password, :file, :website, :email, :color)
  end
  
end