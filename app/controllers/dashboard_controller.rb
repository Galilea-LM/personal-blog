# frozen_string_literal: true

class DashboardController < ApplicationController
  layout "banner"

  def index
    @user = current_user
  end
end
