class  Admin::ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    if current_user.profile
      @profile = current_user.profile 
    else
      @profile = Profile.new
      render :new
    end
  end

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.biography = @profile.rich_biography.to_plain_text
    if @profile.save
      redirect_to admin_profile_path, notice: 'profile was successfully created.'
    else
      render :edit, notice: 'profile error'
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      @profile.biography = @profile.rich_biography.to_plain_text
      redirect_to root_path, notice: 'Profile was updated'
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :age, :work, :rich_biography, :image_profile).merge(user_id: current_user.id)
  end
end
