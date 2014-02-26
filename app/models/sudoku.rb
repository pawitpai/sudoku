class Sudoku < ActiveRecord::Base

	 validates :column1, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column2, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column3, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column4, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column5, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column6, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column7, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column8, numericality: { only_integer: true ,message: "Integer only"}
	 validates :column9, numericality: { only_integer: true ,message: "Integer only"}

end
 