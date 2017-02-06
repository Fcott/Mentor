class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:drafts, :saving]
  before_action :correct_user, only: [:drafts, :saving]

  def show
    @user = User.find(params[:id])
    @own_stories = @user.stories.published
    @profile = @user.profile
    @job_categories = @user.job_categories
  end

  def drafts
    @user = User.find(params[:user_id])
    @drafts = @user.stories.drafts
    @profile = @user.profile
    @job_categories = @user.job_categories
  end

  def saving
    @user = User.find(params[:user_id])
    @saved_stories = @user.saved_stories
    @profile = @user.profile
    @job_categories = @user.job_categories
  end

  def profile
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @job_categories = @user.job_categories
    @self_introduction = @profile.self_introduction
    @interest = @profile.interest
    @education = @profile.education
    @work_experience = @profile.work_experience
    @languages = @profile.languages
    @others = @profile.others
  end

  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
    @job_categories = @user.job_categories
  end

  def update
    @user = User.find(params[:id])
    @profile = @user.profile

    if @user.update(user_params)
      redirect_to user_profile_path(@user)
    else
      render 'edit'
    end
  end


  private
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to root_url unless current_user == @user
  end

  def user_params
    params.require(:user).permit(
    [user_jobs_attributes: [:id, :user_id, :job_category_id, :_destroy]],
    [profile_attributes: [:id, :self_introduction, :interest, :education, :work_experience, :languages, :others]]
    )
  end
end
