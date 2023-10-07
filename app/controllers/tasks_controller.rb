class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = @project.tasks.build
    3.times { @task.attachments.build }
  end

  def edit
  end

  def create
    @task = @project.tasks.build(task_params)
    save_task('Task was successfully created.', :new)
  end

  def update
    @task.assign_attributes(task_params)
    save_task('Task was successfully updated.', :edit)
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project), notice: 'Task was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def save_task(success_notice, fail_action)
    if @task.save
      redirect_to project_task_path(@project, @task), notice: success_notice
    else
      render fail_action
    end
  end

  def task_params
    params.require(:task).permit(:subject, :description, :status, :user_id, attachments_attributes: [:id, :upload, :description, :_destroy])
  end
end
