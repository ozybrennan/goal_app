class GoalsCheckbox < ActiveRecord::Migration
  def change
    add_column(:goals, :completed, :boolean)
    add_index(:goals, :completed)
  end
end
