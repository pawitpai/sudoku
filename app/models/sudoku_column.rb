class SudokuColumn < ActiveRecord::Base
	belongs_to :sudoku_row
end