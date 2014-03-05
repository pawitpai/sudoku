class Sudoku < ActiveRecord::Base
	validates :field11, presence: true, inclusion: 1..9
	validates :field12, presence: true, inclusion: 1..9
	validates :field13, presence: true, inclusion: 1..9
	validates :field21, presence: true, inclusion: 1..9
	validates :field22, presence: true, inclusion: 1..9
	validates :field23, presence: true, inclusion: 1..9
	validates :field31, presence: true, inclusion: 1..9
	validates :field32, presence: true, inclusion: 1..9
	validates :field33, presence: true, inclusion: 1..9
end