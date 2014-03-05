class AddSudokusTable < ActiveRecord::Migration
  def up
  	create_table :sudokus do |t|
      t.integer :field11
      t.integer :field12
      t.integer :field13
      t.integer :field21
      t.integer :field22
      t.integer :field23
      t.integer :field31
      t.integer :field32
      t.integer :field33
      t.timestamps
    end
  end

  def down
  end
end
