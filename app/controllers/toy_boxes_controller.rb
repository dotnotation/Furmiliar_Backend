class ToyBoxesController < ApplicationController
  before_action :set_toy_box, only: [:show, :update, :destroy]

  # GET /toy_boxes
  def index
    @toy_boxes = ToyBox.all

    render json: @toy_boxes, only: [:photo, :name, :id], include: {
        toys: {
          except: [:created_at, :updated_at]
        }
    }
  end

  # GET /toy_boxes/1
  def show
    render json: @toy_box, only: [:photo, :name, :id], include: {
      toys: {
        except: [:created_at, :updated_at]
      }
    }
  end

  # POST /toy_boxes
  def create
    # byebug
    @toy_box = ToyBox.new(toy_box_params)

    if @toy_box.save
      # render json: {
      #   status: 201,
      #   toy_box: @toy_box, 
      # }, status: :created, location: @toy_box
      # byebug
      render json: @toy_box, only: [:photo, :name, :id], include: {
        toys: {
          except: [:created_at, :updated_at]
        }
      }
      
    else 
      render json: {
        status: 422,
        errors: @toy_box.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /toy_boxes/1
  def update
    if @toy_box.update(toy_box_params)
      render json: {
        status: 204,
        toy_box: @toy_box
      }
    else
      render json: {
        status: 400,
        errors: @toy_box.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # DELETE /toy_boxes/1
  def destroy
    if @toy_box.destroy
      render json: {message: "Successfully deleted", toy_box: @toy_box}
    else
      render json: {message: "Something went wrong"}
    end
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
