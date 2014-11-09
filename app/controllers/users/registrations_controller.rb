class Users::RegistrationsController < Devise::RegistrationsController
  after_filter :give_badge

  def give_badge
    if current_user
      add_badge = true
      current_user.badges.each do |b|
        if b.id == 1
          add_badge = false
        end
      end
      if add_badge
        current_user.add_badge(1)
      end
    end
  end
end
