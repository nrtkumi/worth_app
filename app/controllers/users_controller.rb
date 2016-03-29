class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @jobs = ["高校生", "大学生", "会社員", "総理大臣", "ウェーイ", "フリーター", "ビジュアル系バンドのボーカル", "マーク・ザッカーバーグ"]
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      redirect_to edit_user_path(@user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :job, :gender, :introduction)
  end
end
