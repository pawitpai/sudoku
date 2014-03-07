class SudokuTopic < ActiveRecord::Base
has_many :sudoku_rows, :dependent => :destroy
  accepts_nested_attributes_for :sudoku_rows
end