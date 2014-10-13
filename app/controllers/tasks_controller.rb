class TasksController < ApplicationController
  before_action :set_task, only: [:show, :complete, :update, :destroy]



  def index
    @list = current_user.lists.find_by_id(params[:list_id])
    @tasks = (@list ? @list.tasks : Task.all)
  end

  def show
  end


  def new
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks
  end

  def complete
    index
    @update_task = Task.where(id: @task.id).first
    @update_task.update_attribute(:complete?, "true")
    redirect_to list_tasks_url, notice: 'Task has been completed.'
  end

  # POST /tasks
  def create
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.create(task_params)
    redirect_to list_tasks_url, notice: 'Task was successfully created.'
  end


  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to list_tasks_url, notice: 'Task was successfully completed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.


  def find_list
    @list = current_user.lists.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :description, :due_date, :complete?)
  end
end
