class AddSudokuTable < ActiveRecord::Migration
  def up
  	    create_table :sudokus do |t|
      t.string :topic
      t.integer :column1
      t.integer :column2
      t.integer :column3
      t.integer :column4
      t.integer :column5
      t.integer :column6
      t.integer :column7
      t.integer :column8
      t.integer :column9
  end
  end

  def down
  end
end
