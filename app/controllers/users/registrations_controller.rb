class Users::RegistrationsController < Devise::RegistrationsController
  after_filter :give_badge

  def give_badge
    current_user.add_badge(1)
  end
end
