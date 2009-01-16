class PeopleController < ApplicationController
  before_filter :load_all_roles, :only => [:new, :edit, :create, :update]
  
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
    @person = Person.find(params[:id], :include => :roles)
  end

  def show
    @person = Person.find(params[:id], :include => :roles)
  end

  def destroy
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
end
