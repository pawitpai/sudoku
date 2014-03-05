class SudokuPackage < ActiveRecord::Migration
  def up
  	create_table :sudoku_topics do |t|
      t.string :topic

    end
  	create_table :sudoku_rows do |t|
      t.integer :value
      t.integer :sudoku_topic_id

    end

      	create_table :sudoku_columns do |t|
      t.integer :value
      t.integer :sudoku_row_id

    end
  end

  def down
  end
end
