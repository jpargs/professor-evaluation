class Site::TeachersController < SiteController

  def index
    @teachers = Teacher.all
  end
  
  def show
    id = params[:slug].split("-")[0]
    @teacher = Teacher.find(id)
  end
end