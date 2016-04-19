class ProjectsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, only:[:new, :edit, :update, :destroy]
  before_action :correct_project, only:[:edit, :update, :destroy]


  def index
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    file = params[:project][:image]
    @project.set_project_image(file)

    if @project.save
      redirect_to @project, notice: '新規プロジェクトを募集開始しました'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    file = params[:project][:image]
    @project.set_project_image(file)

    if @project.update(project_params)
      redirect_to @project, notice: 'プロジェクト情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def search
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
    @projects = Project.search(params[:q])
    @result = params[:q]
    render :index
  end

  def category
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
    @projects = Project.category(params[:p][:category])
    @result = params[:p][:category]
    render :index
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :caption,
     :business, :social, :music, :art, :event, :product, :app, :game,
      :food, :global, :fashion, :movie, :book)
  end

  def correct_project
    project = Project.find(params[:id])
    if !current_user?(project.user)
      redirect_to root_path, notice: 'リクエストが不正じゃゴラァァァ！！'
    end
  end
end
