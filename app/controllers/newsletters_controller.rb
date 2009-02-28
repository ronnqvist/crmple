class NewslettersController < ApplicationController
  before_filter :login_required
  def index
    @roles = Role.all
  end
  
  def list
    if params[:send_to_all]
      @list = Person.subscribers.map(&:email).join(', ')
    else
      @list = Newsletter.subscribers(params[:selected_roles])
    end
    
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
