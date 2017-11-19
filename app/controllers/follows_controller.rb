class FollowsController < ApplicationController

  def create
    @profile = Profile.find(params[:profile_id])
    current_profile.follow(@profile)
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    current_profilestop_following(@profile)
  end

end