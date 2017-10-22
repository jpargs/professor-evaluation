class Site::SubjectsController < SiteController
  
  def index
    @subjects = Subject.all
  end
  def show
    id = params[:slug].split("-")[0]
    @subject = Subject.find(id)
  end
  
end
