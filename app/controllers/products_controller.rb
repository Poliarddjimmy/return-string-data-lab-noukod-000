class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        # raise params.inspect
        @product =  Product.create(product_params)
        redirect_to products_path
    end
    
    def description
        # raise params.inspect
        product = Product.find(params[:id])
        render plain: product.description
    end

    def inventory
        product = Product.find(params[:id])
        render plain: product.inventory > 0 ? true : false
    end

    private
    def product_params
        params.require(:product).permit(:name, :price, :inventory, :description)
    end
end
