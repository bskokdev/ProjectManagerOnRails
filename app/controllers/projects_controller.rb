class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    save_project('Project was successfully created.', :new)
  end

  def update
    @project.assign_attributes(project_params)
    save_project('Project was successfully updated.', :edit)
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def save_project(success_notice, fail_action)
    if @project.save
      redirect_to @project, notice: success_notice
    else
      render fail_action
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
