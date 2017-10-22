class AdminController < ApplicationController
  #devise method
  before_action :check_and_authenticate_user
  before_action :authenticate_user!

  #Define the layout
  layout 'admin'

  # Prevent flash to appear when you reload page.
  def remove_flashes_on_ajax_page
    return unless request.xhr?
    response.headers['X-Message'] = flash[:error] unless flash[:error].blank?
    response.headers['X-Message'] = flash[:notice] unless flash[:notice].blank?

    flash.discard
  end


  # This method is responsible for building the conditions being
  # used by the jQuery DataTables to retrieve the data to be
  # displayed.
  #
  # Parameters:
  # @model = The model object being queried.
  # Returns:
  # The model with the added conditions.
  def get_conditions(model)
    # Parse the columns passed by datatables to build SQL where clause.
    params[:columns].each do |column|
      if column[1][:name].present? && column[1][:search][:value].present?
        # Use like %% if string is passed, = otherwise.
        # if is_numeric?(column[1][:search][:value])
        #   model = model.where("#{column[1][:name]}=?", column[1][:search][:value])
        # else
          model = model.where("#{column[1][:name]}::character varying ilike ?", "%#{column[1][:search][:value]}%")
        # end
      end
    end

    return model
  end

  # This method is responsible for building the order clause
  # being used by the jQuery DataTables.
  #
  # Parameters:
  # @model = The model object being queried.
  # Returns:
  # The model with the added conditions.
  def get_order_clause(model)
    if params[:order][:"0"][:column].present? && params[:order][:"0"][:dir].present?
      column_to_order = params[:order][:"0"][:column].to_i + 2

      model = model.order("#{column_to_order} #{params[:order][:"0"][:dir]}")
    end

    return model
  end

  # This method is responsible for obtaining the data on a specific
  # page when there are multiple pages.
  #
  # Parameters:
  # @page_number: The page number passed by datatables.
  # @items_per_page = The number of items per page.
  # Returns:
  # The model with the added conditions.
  def get_page_data(model)
    return model.paginate(:page=>page, :per_page=>per_page)
  end

  private
    def check_and_authenticate_user
      redirect_to "/admin/login" unless user_signed_in?
    end

    # Determine the page number.
    def page
      (params[:start].to_i/per_page)+1
    end

    # Number of items per page as passed by DataTables.
    def per_page
      params[:length].to_i
    end

    # This is a helper method that checks whether and object is numeric or not.
    #
    # Parameters:
    # @obj = The object to check if numeric or not.
    # Returns:
    # True if the object is numeric, False otherwise.
    def is_numeric?(obj)
      obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
    end
end
