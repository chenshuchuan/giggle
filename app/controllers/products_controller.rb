class ProductsController < ApplicationController
  include ApplicationHelper
  before_action :find_product, only: :show

  def index
    @products = Product.all
  end

  def show
    @evaluates = @product.evaluates.order("id desc").limit(5)
    @message = @product.messages.build
    @messages = @product.feed.page(params[:page])
  end

  def preview_markdown
    render text: markdown(params[:body])
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end
end
