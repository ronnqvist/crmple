class PeopleController < ApplicationController
  before_filter :login_required
  #Needs to be: before_filter :login_required , :except => [:something]
  #once we start using registration from external pages.

  before_filter :load_all_roles, :only => [:new, :edit, :create, :update]
  before_filter :find_person_with_includes, :only => [:edit, :show]
  
  def index
    @people = Person.all(:include => :roles, :order => 'lastname ASC')
  end
  
  def new
    @person = Person.new
    @person.emails.build
    @person.phones.build
    @person.addresses.build
  end

  def edit
  end

  def show
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    
    respond_to do |format|
      format.html { redirect_to people_path }
      format.xml { head :ok }
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = t('person.updated')
      redirect_to @person
    else
      render :action => 'edit'
    end
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      flash[:notice] = t('people.flash.success')
      redirect_to @person
    else
      flash[:error] = t('people.flash.error')
      render :action => 'new'
    end
  end
  
  private
  
  def load_all_roles
    @roles ||= Role.all
  end
  
  def find_person_with_includes
    @person ||= Person.find(params[:id], :include => [:roles, :phones, :emails, :addresses])
  end
end
