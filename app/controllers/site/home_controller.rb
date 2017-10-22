class Site::HomeController < SiteController

  def index
    @subjects = Subject.all
  end
  
end
