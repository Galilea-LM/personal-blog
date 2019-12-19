class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :permitted_user!

  def notice_flash(model)
    localize_flash(model, :notice)
  end

  def alert_flash(model)
    localize_flash(model, :alert)
  end

  def localize_flash(model, type)
    default_key = "flash.#{action_name}.#{type}"
    model_key = "flash.#{action_name}.#{model.model_name.element}.#{type}"

    I18n.t(model_key, default: I18n.t(default_key))
  end

  def permitted_user!
    redirect_to root_path unless current_user.admin?
    true
  end
end
