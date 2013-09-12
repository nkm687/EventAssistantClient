require 'rho/rhocontroller'
require 'helpers/browser_helper'

class UserratingController < Rho::RhoController
  include BrowserHelper

  # GET /Userrating
  def index
    @userratings = Userrating.find(:all)
    render :back => '/app'
  end

  # GET /Userrating/{1}
  def show
    @userrating = Userrating.find(@params['id'])
    if @userrating
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Userrating/new
  def new
    @userrating = Userrating.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Userrating/{1}/edit
  def edit
    @userrating = Userrating.find(@params['id'])
    if @userrating
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Userrating/create
  def create
    @userrating = Userrating.create(@params['userrating'])
    redirect :action => :index
  end

  # POST /Userrating/{1}/update
  def update
    @userrating = Userrating.find(@params['id'])
    @userrating.update_attributes(@params['userrating']) if @userrating
    redirect :action => :index
  end

  # POST /Userrating/{1}/delete
  def delete
    @userrating = Userrating.find(@params['id'])
    @userrating.destroy if @userrating  
    redirect :action => :index  
  end
  
  def updateRating
   # rating =AppApplication.rating
   demoid = @params['demoid']
     rating = @params['rating']
      
   @userrating = Userrating.find(:first, :conditions => {name: 'nkm687',demo: demoid})
     if(@userrating)
        @userrating.update_attributes({name:'nkm687',demo: demoid,rating: rating})
     else
       # @userrating = Userrating.new('nkm687',demoid,rating)
        @userrating = Userrating.create({name:'nkm687',demo: demoid,rating: rating})
     end
    redirect :action => :index
  end
  
end
