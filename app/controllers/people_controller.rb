class PeopleController < ApplicationController
  def index
    @people = Person.all(:include => :roles, :order => 'lastname ASC')
  end
  
  def new
    @person = Person.new
    @roles  = Role.all
  end

  def edit
  end

  def show
    @person = Person.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def create
    @person = Person.new(params[:person])
    @roles = Role.all
    if @person.save
      flash[:notice] = t('people.flash.success')
      redirect_to @person
    else
      flash[:error] = t('people.flash.error')
      render :action => 'new'
    end
  end

end
