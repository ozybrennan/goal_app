class CreateCheers < ActiveRecord::Migration
  def change
    remove_column :goals, :cheers
    create_table :cheers do |t|
      t.integer :user_id
      t.integer :goal_id

      t.timestamps null: false
    end
  end
end
