ActiveAdmin.register FirstPaymentDesired do
 config.per_page = 20

 index do
    selectable_column
    id_column
    column "Payment Id", :payment_id
    column "App Id", :app_id
    column :application_identifier
    column :circle
    column :ulb_name
    column :district_administration_area
    column :application_identifier
    column "Application Status", :status
    column :payment_status
    column :payment_completed_at
    column :razorpay_order_id
    column "Payment Gateway Name", :payment_method
    column :payment_method
    column "Remark1", :remark
    column "Remark2", :remark
    column :revised_fee
    column "Sum OF Amount", :amount
    div(id: 'get_lower_first') do
      # panel 'Total Amount' do
        render partial: 'get_all_amount'
      # end
    end
    actions
  end


  filter :app_id
  filter :application_identifier
  filter :amount
  filter :razorpay_order_id
  filter :payment_method, label: "Payment Gateway Name"
  filter :payment_completed_at
  filter :ulb_name
  filter :district_administration_area, label: "District"
  filter :application_identifier
  filter :payment_status
  filter :status, label: "Application Status"
  filter :payment_completed_at
  filter :razorpay_order_id
  filter :payment_method, label: "Payment Gateway Name"
  filter :payment_method

  
  csv do
    column :payment_id
    column :app_id
    column :application_identifier
    column :circle
    column :ulb_name
    column :district_administration_area
    column :application_identifier
    column :status
    column :payment_status
    column :payment_completed_at
    column :razorpay_order_id
    column :payment_method
    column :payment_method
    column "Remark1" do |payment_data|
      payment_data.remark
    end
    column "Remark2" do |payment_data|
      payment_data.remark
    end
    column :revised_fee
    column "Sum OF Amount", :amount
  end

  action_item only: :index do
    link_to 'Import', import_admin_payment_details_path
  end

# ....
end
