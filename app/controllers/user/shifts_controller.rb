class User::ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: %i[show edit update destroy
                                     show_user_description
                                     new_user_description
                                     create_user_description]
  attr_accessor :description

  # GET /shifts or /shifts.json
  def index
    @shifts = current_user.shifts.order(id: :desc)
    @shift  = current_user.shifts.where(clock_out: nil).where.not(clock_in: nil).first
  end

  # GET /shifts/1 or /shifts/1.json
  def show; end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # POST /shifts
  def create
    @shift = Shift.new(user: current_user) # quando criar ja liga ao id
    respond_to do |format|
      if @shift.save
        format.html do
          redirect_to action: 'index', user_id: current_user
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /shifts/1/edit
  def edit; end

  # PATCH/PUT /shifts/1
  def update
    @shift.set_clock_out
    respond_to do |format|
      if @shift.save
        format.html do
          redirect_to action: 'index', user_id: current_user
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html do
        redirect_to action: 'index', user_id: current_user
      end
    end
  end

  def show_user_description; end

  def new_user_description; end

  def create_user_description
    respond_to do |format|
      if @shift.update_attribute(:description, shift_params[:description])
        format.html do
          redirect_to action: 'index', user_id: current_user
        end
      else
        format.html { render :description, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shift
    @shift = Shift.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shift_params
    params.require(:shift).permit(:clock_in, :clock_out, :user_id, :user_name, :description)
  end
end
