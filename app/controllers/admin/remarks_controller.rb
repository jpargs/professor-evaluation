class Admin::RemarksController < AdminController

  def index
    @remarks = Remark.all.order(:created_at)
  end
  def show
    @remark = Remark.find(params[:id])
  end

end