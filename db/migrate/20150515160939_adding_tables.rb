class AddingTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
    end

    create_table(:venues) do |t|
      t.column(:name, :string)
    end

  end
end
