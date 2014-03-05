class SudokuRow < ActiveRecord::Base
	belongs_to :sudoku_topic
	has_many :sudoku_columns
end