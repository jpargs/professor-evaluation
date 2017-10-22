class Admin::TeachersController < AdminController
  before_action :set_available, only: [:new, :edit]
  def index
    @teachers = Teacher.all
    
  end
  
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teachers_params)
    if @teacher.save
      flash[:notice] = "<strong>" + @teacher.name + "</strong> has been successfully added."
    end

    redirect_to "/admin/teachers"
  end

  def edit
    @teacher = Teacher.find(params[:id])

  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teachers_params)
      flash[:notice] = "<strong>" + @teacher.name + "</strong> has been successfully updated."
    end

    redirect_to "/admin/teachers"
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.class_assignments.destroy
    @teacher.destroy
    flash[:notice] = "<strong>" + @teacher.name + "</strong> has been successfully removed."
    redirect_to "/admin/teachers"
  end
  
  def set_available
    @subjects = Subject.all

  end
  private 
  
  def teachers_params
    params.require(:teacher).permit(:first_name, :last_name,class_assignments_attributes: [ :id, :teacher_id, :subject_id, :_destroy ])
  end


  
end