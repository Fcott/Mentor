class ProfilesController < ApplicationController

  def edit
  end

  def update
  end

  private
  def profile_params
    params.require(:profile).permit(:self_introduction, :interest, :education, :work_experience, :languages, :others)
  end
end
