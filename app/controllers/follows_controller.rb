class FollowsController < ApplicationController

  def create
    @profile = Profile.find(params[:profile_id])
    current_profile.follow(@profile)
    status = 1
    render :json => {:message => "UnFollow",:state=>status}
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    current_profilestop_following(@profile)
  end

end