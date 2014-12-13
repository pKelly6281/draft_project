class PicksController < ApplicationController
  #before_action :logged_in_user, only: [:index]
  @round = 0
  @pickNumber = 0

  def new
  	@pick = Pick.new
  	@user = current_user
  	@round = last_round
    @pickNumber = last_pick
    if(@pickNumber == 5)
        @round +=1
        @pickNumber=1
    else
        @pickNumber+=1
    end
    @team = next_team(@pickNumber, @round)
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
    @round = last_round
    @pickNumber = last_pick
  end

  private
  	def pick_params
  		params.require(:pick).permit(:round, :pick, :user, :team, :player)
  	end
    def last_round
      last_pick = Pick.order("created_at").last
      last_round = last_pick.round
      if(last_round == nil)
        last_round =1
    end
    def last_pick
        last_pick = Pick.order("created_at").last
        l_pick = last_pick.pick
        if (l_pick == nil)
          l_pick =1
    end
    def next_team (pickNum,roundNum)
      oddTeam = ["Team 1","Team 2","Team 3","Team 4","Team 5"]
      evenTeam = oddTeam.reverse
      pickNum -=1
      if(roundNum%2 == 0)
        return evenTeam[pickNum]
      else
        return oddTeam[pickNum]
      end
    end

end
