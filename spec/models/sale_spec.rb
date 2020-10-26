require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'Save Sale' do
    before do
      @customer = Customer.create!(customer_params)
      @address = Address.create!(address_params)
      @vendor = Vendor.create!(vendor_params)
      @sale = Sale.new (sale_params.merge ({
        customer: @customer, address: @address, vendor: @vendor
      }))
    end

    context 'Validations' do
      context 'with customer, address and vendor information' do
        it 'sale is valid' do
          expect(@sale.valid?).to  be_truthy
        end
        it 'create sale' do
          expect{
            @sale.save!
          }.to change { Sale.count }.by(1) 
        end
      end

      context 'without customer' do
        before do
          @sale_without_customer = Sale.new(sale_params.merge({
            address: @address, vendor: @vendor
          }))
        end
        it 'sale is invalid - missing customer' do
          expect(@sale_without_customer.valid?).to  be_falsey
        end

        it 'does not create the sale' do
          expect{
            @sale_without_customer.save
          }.to  change { Sale.count }.by(0)
        end
      end

      context 'without address' do
        before do
          @sale_without_address = Sale.new(sale_params.merge({
            customer: @customer, vendor: @vendor
          }))
        end

        it 'sale is invalid - missing address' do
          expect(@sale_without_address.valid?).to  be_falsey            
        end

        it 'does not create the sale' do
          expect {
            @sale_without_address.save
          }.to change { Sale.count}.by(0)
        end
      end

      context 'without vendor' do
        before do
          @sale_without_vendor = Sale.new(sale_params.merge({
            customer: @customer, address: @address
          }))
        end

        it 'sale is invalid - miising vendor' do
          expect(@sale_without_vendor.valid?).to be_falsey
        end

        it 'does not create the sale' do
          expect {
            @sale_without_vendor.save
          }.to change {Sale.count}.by(0)
        end
      end
    end
  end

  def sale_params
    { description: "New offer of Milk shake", quantity: 3, unit_price: 9.90}
  end

  def customer_params
    {name: "Litle John"}
  end

  def address_params
    {name: "Street without name"}
  end

  def vendor_params
    {name: "Bugger King"}
  end
end
