ActiveAdmin.register SecondPaymentDesired do

  config.per_page = 20  
  index do 
    selectable_column
    id_column
    column :app_id do |paymen_data|
      paymen_data.app_id  
    end 
    column :application_identifier
    column :circle
    column :ulb_name
    column :district_administration_area
    column "Revised Fee - TRUE", :revised_fee do |payment_data|
     pd_amount = []   
      PaymentDetail.where(app_id: payment_data.app_id).each do |p_d|
      if p_d.revised_fee == true
         pd_amount << p_d.amount
      end
    end 
    pd_amount.sum 
    end
    column "Revised Fee - False", :revised_fee do |payment_data|
      pd_amount = []  
      PaymentDetail.where(app_id: payment_data.app_id).each do |p_d|
      if p_d.revised_fee == false
         pd_amount << p_d.amount
      end
    end  
    pd_amount.sum
    end 
    column "Sum OF Amount" do |payment_data|
      PaymentDetail.where(app_id: payment_data.app_id).sum(:amount)
    end 
    div(id: 'get_lower_second') do
      render partial: 'admin/first_payment_desireds/get_all_amount'
    end
    actions
  end

  filter :app_id
  filter :application_identifier
  filter :ulb_name
  filter :district_administration_area
    filter :revised_fee


   csv do
    column :app_id
    column :application_identifier
    column :circle
    column :ulb_name
    column :district_administration_area
    column :revised_fee
    column "Sum OF Amount" do |payment_data|
      payment_data.amount
    end
  end

  action_item only: :index do
    link_to 'Import', import_admin_payment_details_path
  end
  
end
