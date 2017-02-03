class ProfilesController < ApplicationController

  def edit
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to user_profile_path(@user)
    else
      render 'edit'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:self_introduction, :interest, :education, :work_experience, :languages, :others)
  end
end
