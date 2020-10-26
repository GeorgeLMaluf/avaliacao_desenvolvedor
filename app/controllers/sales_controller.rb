class SalesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @sales = Sale.all
    @total_sales = @sales.map { |data| data[:unit_price].to_f * data[:quatity].to_f }.inject(':-')
  end

end
