class CreateUserInfo < ActiveRecord::Migration[7.0]
  def change
    create_table :user_infos do |t|
      t.string :email, null: false
      t.string :user_id, null: false
      t.timestamps
    end

    # ユニーク制約をインデックスで追加
    add_index :user_infos, :email, unique: true
    add_index :user_infos, :user_id, unique: true
  end
end