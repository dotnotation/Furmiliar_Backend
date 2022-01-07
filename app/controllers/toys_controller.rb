class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :update, :destroy]

  # GET /toys
  def index
    @toys = Toy.all

    render json: @toys, except: [:created_at, :updated_at]
  end

  # GET /toys/1
  def show
    render json: @toy, except: [:created_at, :updated_at]
  end

  # POST /toys
  def create
    @toy = Toy.new(toy_params)

    if @toy.save
      # render json: {
      #   status: 201,
      #   toy: @toy
      # }, status: :created, location: @toy
      render json: @toy, except: [:created_at, :updated_at]
    else
      render json: {
        status: 422,
        errors: @toy.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /toys/1
  def update
    if @toy.update(toy_params)
    #   render json: {
    #     status: 204,
    #     toy: @toy
    # }
      render json: @toy, except: [:created_at, :updated_at]
    else
      render json: {
        status: 400,
        errors: @toy.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # DELETE /toys/1
  def destroy
    if @toy.destroy
      render json: {message: "Successfully deleted", toy: @toy}
    else
      render json: {message: "Someting went wrong"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toy
      @toy = Toy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def toy_params
      params.require(:toy).permit(:name, :photo, :price, :brand, :url, :rating, :needs_repair, :squeaker, :crinkle, :treat, :toy_box_id)
    end
end
