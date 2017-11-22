class FollowsController < ApplicationController

  def create
    @profile = Profile.find(params[:profile_id])
    message = nil
    if current_profile.following?(@profile)
    	current_profile.stop_following(@profile)
    	message = "Follow"
    else
    	current_profile.follow(@profile)
    	message = "UnFollow"
    end
    status = 1
    render :json => {:message => message,:state=>status}
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    current_profilestop_following(@profile)
  end

end