class CreatePurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_histories do |t|
      t.string :user_id, null: false
      t.string :product_id, null: false

      t.timestamps
    end

    # user_id と product_id の組み合わせを一意にする
    add_index :purchase_histories, [:user_id, :product_id], unique: true
  end
end
