ActiveAdmin.register PaymentDetail do

  action_item only: :index do
    link_to 'Import',import_admin_payment_details_path
  end

  

  collection_action :import, method: :get do

  end

  collection_action :import_data, method: :post do
    if xlsx_data = Roo::Spreadsheet.open(params[:file].path)
      headers = xlsx_data.row(1)
      xlsx_data.each_with_index do |row, idx|
        next if idx == 0 # skip header
        # create hash from headers and cells
        payment_data = Hash[[headers, row].transpose]
        pd = PaymentDetail.new(payment_data)
        unless pd.save
          raise ActiveRecord::Rollback
        end  
      end
      flash[:notice] = "Payment Data has successfully imported"
      redirect_to :action => :index
    else
      flash[:notice] = "Something went wrong"
      redirect_to  import_admin_payment_details_path
    end  
  end
  
end
