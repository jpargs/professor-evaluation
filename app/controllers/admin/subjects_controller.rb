class Admin::SubjectsController < AdminController
  before_action :set_available, only: [:new, :edit]
  def index
    @subjects = Subject.all
    
  end
  
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subjects_params)
    if @subject.save
      flash[:notice] = "<strong>" + @subject.subject_code + "</strong> has been successfully added."
    end

    redirect_to "/admin/subjects"
  end

  def edit
    @subject = Subject.find(params[:id])
    
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subjects_params)
      flash[:notice] = "<strong>" + @subject.subject_code + "</strong> has been successfully updated."
    end

    redirect_to "/admin/subjects"
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.class_assignments.destroy
    @subject.destroy
    flash[:notice] = "<strong>" + @subject.subject_code + "</strong> has been successfully removed."
    redirect_to "/admin/subjects"
  end


  def set_available
    @teachers = Teacher.all
  end
    
  def subjects_params
    params.require(:subject).permit(:subject_code, :subject_name,class_assignments_attributes: [ :id, :teacher_id, :subject_id, :_destroy ])
  end

end