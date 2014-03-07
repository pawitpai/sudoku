class SudokusController < ApplicationController
  # GET /sudokus
  # GET /sudokus.json
  def index
    @sudokus = SudokuTopic.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sudokus }
    end
  end

  # GET /sudokus/1
  # GET /sudokus/1.json
  def show
    @sudoku = Sudoku.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sudoku }
    end
  end

  # GET /sudokus/new
  # GET /sudokus/new.json
  def new
    @sudoku = SudokuTopic.new


  9.times do
    row = @sudoku.sudoku_rows.build
    9.times { row.sudoku_columns.build }
  end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sudoku }
    end
  end

  # GET /sudokus/1/edit
  def edit
    @sudoku = SudokuTopic.includes({:sudoku_rows=>:sudoku_columns}).find(params[:id])
    
    #can also use .find but need to call find before include

    #topics=[t1,t2,t3]
    #t.sudoku_rows   #=> [r_1_1,..,r_1_9]
    #r_1_1.sudoku_columns #=>[ c_1_1_1_,..,c_1_1_1_9]


    #include({:sudoku_rows=>:sudoku_columns}) 1..*
    #include([:sudoku_rows,:sudoku_columns]) *..*
  end

  # POST /sudokus
  # POST /sudokus.json
def create
    @get_sudoku_topic = SudokuTopic.new(params[:sudoku_topic])
    @get_sudoku_topic.save

     # for i in 1..9
     #    @sudoku_row=SudokuRow.new
     #    @sudoku_row.value=0   # must no value (wrong design)
     #    @sudoku_row.sudoku_topic=@get_sudoku_topic
     #    @sudoku_row.save
     #   for i2 in 1..9


     #    sudoku_column=SudokuColumn.new
     #    sudoku_column.value=params[i.to_s+","+i2.to_s] 
     #    sudoku_column.sudoku_row=@sudoku_row
     #    sudoku_column.save
     #   #SudokuRow.create(value: i.to_s+","+i2.to_s ,sudoku_topic: @get_sudoku_topic)
     #   end
     # end

    #params[:sudoku_topic][:sudoku_rows].each do |row|
     # sudoku_row = @get_sudoku_topic.sudoku_rows.build
      #row[:sudoku_columns].each do |column|
      #  sudoku_row.sudoku_columns.build(value: column[:value])
     # end
    #end  
    #@get_sudoku_topic.save



  end


  

  # PUT /sudokus/1
  # PUT /sudokus/1.json
  def update
    #@sudoku = Sudoku.find(params[:id])
   @get_sudoku_topic = SudokuTopic.new(params[:sudoku_topic])
 #  @get_sudoku_topic.topic="test update by code"
   @get_sudoku_topic.save


    respond_to do |format|
      if @sudoku.update_attributes(params[:sudoku_topic])
        format.html { redirect_to @sudoku, notice: 'Sudoku was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sudoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sudokus/1
  # DELETE /sudokus/1.json
  def destroy
    @sudoku = SudokuTopic.find(params[:id])
    @sudoku.destroy

    respond_to do |format|
      format.html { redirect_to sudokus_url }
      format.json { head :no_content }
    end
  end

  def hello
  	@t = "Hello Test"
  end
end