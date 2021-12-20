class ToyBoxesController < ApplicationController
  before_action :set_toy_box, only: [:show, :update, :destroy]

  # GET /toy_boxes
  def index
    @toy_boxes = ToyBox.all

    render json: @toy_boxes
  end

  # GET /toy_boxes/1
  def show
    render json: @toy_box
  end

  # POST /toy_boxes
  def create
    @toy_box = ToyBox.new(toy_box_params)

    if @toy_box.save
      render json: @toy_box, status: :created, location: @toy_box
    else
      render json: @toy_box.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /toy_boxes/1
  def update
    if @toy_box.update(toy_box_params)
      render json: @toy_box
    else
      render json: @toy_box.errors, status: :unprocessable_entity
    end
  end

  # DELETE /toy_boxes/1
  def destroy
    @toy_box.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toy_box
      @toy_box = ToyBox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def toy_box_params
      params.require(:toy_box).permit(:name, :photo)
    end
end
