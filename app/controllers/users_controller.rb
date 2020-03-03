class UsersController < ApplicationController
  before_action :set_user, only: (:show)

  def show
  end

  private

  def set_user
    byebug

    @user = User.find(params[:id])
  end
end
