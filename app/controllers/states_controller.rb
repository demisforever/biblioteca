class StatesController < ApplicationController
  before_action :set_state, only: %i[ show update destroy ]

  # GET /states
  def index
    @states = State.all

    render json: @states
  end

  # GET /states/1
  def show
    render json: @state
  end

  # POST /states
  def create
    result = BookStateCreate.call(state_params: state_params)    
    # logger.debug "New article: #{result.inspect} aaaaaaaaaaaaaaaaa"

    return render status: :bad_request, json: result.error unless result.success?
    render status: :ok, json: result.state
  end

  # PATCH/PUT /states/1
  def update
    if @state.update(state_params)
      render json: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /states/1
  def destroy
    @state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def state_params
      params.require(:state).permit(:borrowed_at, :returned_at, :user_id, :book_id)
    end
end
