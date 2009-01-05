class PeopleController < ApplicationController
  def index
    @people = Person.all(:include => :roles)
  end
  
  def new
    @person = Person.new
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def update
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

end
