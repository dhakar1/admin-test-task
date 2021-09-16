class CreateSecondPaymentDesireds < ActiveRecord::Migration[6.1]
  def change
    create_table :second_payment_desireds do |t|

      t.timestamps
    end
  end
end
