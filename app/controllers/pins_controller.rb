class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = Pin.new
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
    redirect_to @pin, notice: "Pin was succesfully created"
    else
      render action: "new"
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was succesfully updated"
    else
      render action: "edit"
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between to actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list tough.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
