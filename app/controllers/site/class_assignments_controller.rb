class Site::ClassAssignmentsController < SiteController

  def show
    id = params[:slug].split("-")[0]
    @class_assignment = ClassAssignment.find(id)
    @remark = Remark.new

  end
  
end
