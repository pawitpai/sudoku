class SudokusController < ApplicationController
	  # GET /posts
  # GET /posts.json
  def index
    Sudoku.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

	def new
    @sudoku=Sudoku.new
        respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sudoku }
    end
	end			
	
    def create
    @sudoku = Sudoku.new(params[:sudoku])

   
    respond_to do |format|
      if @sudoku.save
        format.html { redirect_to @sudoku, notice: 'Sudoku was successfully created.' }
        format.json { render json: @sudoku, status: :created, location: @sudoku }
      else
        format.html { render action: "new" }
        format.json { render json: @sudoku.errors, status: :unprocessable_entity }
      end
    end
  end

    def show
    @sudoku = Sudoku.find(params[:id])

 sudoku_table = [[@sudoku.column1,@sudoku.column2,@sudoku.column3,@sudoku.column4,@sudoku.column5,
  @sudoku.column6,@sudoku.column7,@sudoku.column8,@sudoku.column9]]
sudoku_correct =[[8,3,5,4,1,6,9,2,7],
               [2,9,6,8,5,7,4,3,1],
               [4,1,7,2,9,3,6,5,8],
               [5,6,9,1,3,4,7,8,2],
               [1,2,3,6,7,8,5,4,9],
               [7,4,8,5,2,9,1,6,3],
               [6,5,2,7,8,1,3,9,4],
               [9,8,1,3,4,5,2,7,6],
               [3,7,4,9,6,2,8,1,5]]
 @sudoku_result=  CheckSudoku.new(sudoku_table).valid?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sudoku }
    end
  end


  def index
    @sudokus = Sudoku.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sudokus }
    end
  end


  def destroy
    @sudoku = Sudoku.find(params[:id])
    @sudoku.destroy

    respond_to do |format|
      format.html { redirect_to sudokus_url }
      format.json { head :no_content }
    end
  end

  def edit
    @sudoku = Sudoku.find(params[:id])
  end

  def update
    @sudoku = Sudoku.find(params[:id])

    respond_to do |format|
      if @sudoku.update_attributes(params[:sudoku])
        format.html { redirect_to @sudoku, notice: 'Sudoku was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sudoku.errors, status: :unprocessable_entity }
      end
    end
  end


class CheckSudoku
def initialize(s_arr)
  @sudoku_arr = s_arr
end

# given 9 integers makesure that you have 1 to 9
def valid_contents?(set)
  set.each do |e|
    return false unless (1..9).include?(e)
  end
  return true
end

# check if set has no duplicates
def has_no_duplicates?(set)
  set.uniq.size < set.size ? false : true
end

def valid_set?(set)
  valid_contents?(set) &&  has_no_duplicates?(set)
end

# obtain blocks of sudoku, given a grid
def get_blocks(s_grid)
  blocks = []
  s_grid.each_slice(3) do |row_set|
    blocks_temp = [[],[],[]]
    row_set.each do |row|
      row.each_slice(3).with_index  do|s,i|
        blocks_temp[i] = blocks_temp[i] + s
      end
    end
    blocks +=  blocks_temp
  end
  blocks
end


def valid?(s_arr = @sudoku_arr)
  #check for row validity
  s_arr.each do |set|
    return false unless valid_set?(set)
  end

  #check for block validity
  get_blocks(s_arr).each do |set|
    return false unless valid_set?(set)
  end

  #check column validity
  s_arr.transpose.each do |set|
    return false unless valid_set?(set)
  end

  true
end

end


end