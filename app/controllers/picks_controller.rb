class PicksController < ApplicationController
  def new
  end

  def index
  	@picks = Pick.All
  end
end
