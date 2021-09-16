class CreatePaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_details do |t|
     t.string :application_identifier
     t.string :application_type
     t.string :approval_for
	   t.string :status
	   t.integer :payment_id
	   t.integer :app_id
	   t.float :amount
	   t.string :transaction_id
	   t.boolean :revised_fee
	   t.string :payment_status
	   t.string :paynimo_status
	   t.datetime :payment_completed_at
	   t.string :payment_method
	   t.string :order_id
	   t.string :razorpay_payment_id
	   t.string :razorpay_order_id
	   t.text :remarks
	   t.text :razorpay_signature
	   t.string :razorpay_status
	   t.string :district_administration_area
	   t.string :district
	   t.string :ulb_name
	   t.string :circle
      t.timestamps
    end
  end
end
