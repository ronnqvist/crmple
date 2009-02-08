class PeopleController < ApplicationController
  before_filter :load_all_roles, :only => [:new, :edit, :create, :update]
  before_filter :find_person_with_includes, :only => [:edit, :show]
  
  def index
    @people = Person.all(:include => :roles, :order => 'lastname ASC')
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @people }
    end
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
    
    respond_to do |format|
      if @person.save
        flash[:notice] = t('people.flash.success')
        format.html { redirect_to @person }
        format.xml { render :xml => @role, :status => :created, :location => @role }
      else
        flash[:error] = t('people.flash.error')
        format.html { render :action => 'new' }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
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
