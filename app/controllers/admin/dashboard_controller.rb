class Admin::DashboardController < AdminController

  def index
    now = Time.now
    @remark_count = Remark.where(updated_at: (now - 24.hours)..now).count(1)
  end

end