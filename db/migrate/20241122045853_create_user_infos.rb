class CreateUserInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :user_infos do |t|
      t.timestamps
    end
  end
end
