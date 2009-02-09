class NewslettersController < ApplicationController
  before_filter :login_required
  def index
    @roles = Role.all
  end
  
  def list
    @list = Newsletter.subscribers(params[:selected_roles])
    
    respond_to do |format|
      format.html # /newsletters/list
      format.js # list.js.rjs
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
