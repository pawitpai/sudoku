class InitialDb < ActiveRecord::Migration
  def up
    create_table :sudoku_topics do |t|
      t.string :topic
  end
  end
end
