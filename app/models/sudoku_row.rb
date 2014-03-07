class SudokuRow < ActiveRecord::Base
	belongs_to :sudoku_topic
	has_many :sudoku_columns, :dependent => :destroy
	  accepts_nested_attributes_for :sudoku_columns
end