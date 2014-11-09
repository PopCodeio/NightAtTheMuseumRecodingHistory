class Users::ProfileController < UserController
  before_filter :is_current_user
  before_filter :check_password_submitted, :only => :update
  expose(:user){ current_user }
  def update
    if user.update_attributes(user_params)
      sign_in(current_user, :bypass => true)
      flash[:notice] = t(:profile_was_successfully_updated)
      redirect_to root_path
      add_badge = true
      current_user.badges.each do |b|
        if b.id == 2
          add_badge = false
        end
      end
      if add_badge
        current_user.add_badge(2)
      end
    else
      render :edit
    end
  end

  def edit

  end
  private
  def check_password_submitted
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      user.updating_password = false
    else
      user.updating_password = true
    end
  end

  def is_current_user
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :address,
      :city,
      :state,
      :zip_code,
      :country,
      :time_zone,
      :phone,
      :gender,
      :occupation,
      :language,
      :photo,
    )
  end
end


