class CreateFirstPaymentDesireds < ActiveRecord::Migration[6.1]
  def change
    create_table :first_payment_desireds do |t|

      t.timestamps
    end
  end
end
