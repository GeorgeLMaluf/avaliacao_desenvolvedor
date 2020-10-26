class SalesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @sales = Sale.all
    @total_sales = @sales.map { |data| data[:unit_price].to_f * data[:quantity].to_f }.inject(0){|sum, x| sum + x}
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy!
    redirect_to sales_path, notice: 'Venda excluída'
  end
    
  def import
    unless sale_upload_params[:file]
      redirect_to :root
      flash[:notice] = "Você deve escolher um arquivo"
      return      
    end
    uploaded_file = sale_upload_params[:file]
    content_file = uploaded_file.read.force_encoding('UTF-8')    

    unless content_file.each_line.first.split(/\t/).count == 6
      redirect_to :root
      flash[:notice] = 'Formato de arquivo incorreto'
      return            
    end

    rows = content_file.to_s.split(/\n/)
    rows.each.with_index do |row, idx|
      if idx > 0
        col = row.to_s.split(/\t/)
        customer_name = col[0]
        description = col[1]
        unit_price = Float(col[2])
        quantity = Float(col[3])
        address = col[4]
        vendor_name = col[5]
        @sale = SaleService.new(params: {
          customer_name: customer_name,  description: description, 
          unit_price: unit_price, quantity: quantity,
          address: address, vendor_name: vendor_name
        }).call!
      end      
    end
    redirect_to sales_path, flash: {notice: 'Arquivo importado con sucesso'}
  end  


  private 
    def sale_upload_params
      params.permit(:file)
    end

end
