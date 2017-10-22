class Site::RemarksController < SiteController

  def index
    
  end
  
  def create
    @remark = Remark.new(remarks_params)
    if @remark.save
      flash[:notice] = "rating has been successfully added."
    end

    redirect_to "/class_assignments/#{params[:remark][:class_assignment_id]}"
  end
  
  private
  def remarks_params
    params.require(:remark).permit(:class_assignment_id, :student_id, :rating, :remark)    
  end
end