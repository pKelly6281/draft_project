class Pick < ActiveRecord::Base

	def pick_params
  		params.require(:pick).permit(:round, :pick, :user, :team, :player)
  	end
end
