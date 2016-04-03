class LikesController < ApplicationController
  before_action :authenticate_user!

  def like
    project = Project.find(params[:project_id])
    like = current_user.likes.build(project_id: project.id)
    like.save
    redirect_to :back
  end

  def unlike
    project = Project.find(params[:project_id])
    like = current_user.likes.find_by(project_id: project.id)
    like.destroy
    redirect_to :back
  end
end
