class SuggestsController < ApplicationController
  before_action :set_suggest, only: [:show, :edit, :update, :destroy]

  # GET /suggests
  # GET /suggests.json
  def index
    @suggests = Suggest.all
  end

  # GET /suggests/1
  # GET /suggests/1.json
  def show
  end

  # GET /suggests/new
  def new
    @suggest = Suggest.new
  end

  # GET /suggests/1/edit
  def edit
  end

  # POST /suggests
  # POST /suggests.json
  def create
    @suggest = Suggest.new(suggest_params)
    @suggest.user_id= current_user.id
    @suggest.suggest_user=current_user.nickname

    respond_to do |format|
      if @suggest.save
        format.html { redirect_to @suggest, notice: 'Suggest was successfully created.' }
        format.json { render :show, status: :created, location: @suggest }
      else
        format.html { render :new }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggests/1
  # PATCH/PUT /suggests/1.json
  def update
    respond_to do |format|
      if @suggest.update(suggest_params)
        format.html { redirect_to @suggest, notice: 'Suggest was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggest }
      else
        format.html { render :edit }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggests/1
  # DELETE /suggests/1.json
  def destroy
    @suggest.destroy
    respond_to do |format|
      format.html { redirect_to suggests_url, notice: 'Suggest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggest
      @suggest = Suggest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggest_params
      params.require(:suggest).permit(:title, :content)
    end
end
