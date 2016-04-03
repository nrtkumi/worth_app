class UsersController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, only:[:show, :edit, :update]
  before_action :correct_user, only:[:edit, :update]
  before_action :set_user, only:[:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @projects = @user.projects
  end

  def edit
    @jobs = ["高校生", "大学生", "会社員", "総理大臣", "ウェーイ", "フリーター", "ビジュアル系バンドのボーカル", "マーク・ザッカーバーグ"]
  end

  def update
    file = params[:user][:image]
    @user.set_image(file)

    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      redirect_to edit_user_path(@user.id)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :job, :gender, :introduction, :url)
  end

  def correct_user
    user = User.find(params[:id])
    if !current_user?(user)
      redirect_to root_path
    end
  end
end
