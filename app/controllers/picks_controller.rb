class PicksController < ApplicationController
  #before_action :logged_in_user, only: [:index]
  @round = 0
  @pickNumber = 0

  def new
  	@pick = Pick.new
  	@user = current_user
  	@round = 1
    @pickNumber = 1
  end

  def create
    @pick = Pick.new(pick_params)
    if @pick.save
      flash[:success] = "Pick Added!"
      redirect_to allpicks_path
    else
      render 'new'
    end
  end

  def index
  	@picks = Pick.all
  end

  private
  	def pick_params
  		params.require(:pick).permit(:round, :pick, :user, :team, :player)
  	end

end
