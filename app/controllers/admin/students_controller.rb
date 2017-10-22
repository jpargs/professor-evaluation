class Admin::StudentsController < AdminController

  def index
    @students = Student.all
    
  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(students_params)
    asd
    if @student.save!
      flash[:notice] = "<strong>" + @student.name + "</strong> has been successfully added."
    end

    redirect_to "/admin/students"
  end

  def edit
    @student = Student.find(params[:id])

  end

  def update
    require_password = 1
    if params[:student][:password].blank?
      require_password = 0
      params[:student].delete("password")
      params[:student].delete("password_confirmation")
      params[:student].delete("current_password")
    end
    
    @student = Student.find(params[:id])
    if @student.update_attributes(students_params)
      flash[:notice] = "<strong>" + @student.name + "</strong> has been successfully updated."
    end

    redirect_to "/admin/students"
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "<strong>" + @student.name + "</strong> has been successfully removed."
    redirect_to "/admin/students"
  end

  def students_params
    params.require(:student).permit(:email, :first_name, :last_name, :password)
  end

  
end