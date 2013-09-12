require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DemoController < Rho::RhoController
  include BrowserHelper

  # GET /Demo
  def index
    @demos = Demo.find(:all)
    render :back => '/app'
  end

  # GET /Demo/{1}
  def show
    @demo = Demo.find(@params['id'])
    if @demo
     render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Demo/new
  def new
    @demo = Demo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Demo/{1}/edit
  def edit
    @demo = Demo.find(@params['id'])
    if @demo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Demo/create
  def create
    @demo = Demo.create(@params['demo'])
   # session[:rating] = @params['rating']
   #   session[:demoid] = @demo.id
      #AppApplication.rating =  @params['rating']
      
    redirect :controller => :Userrating, :action => :updateRating, :query => {:rating => 1, :demoid =>1}  
  end

  # POST /Demo/{1}/update
  def update
    @demo = Demo.find(@params['id'])
    @demo.update_attributes(@params['demo']) if @demo
    redirect :action => :index
  end

  # POST /Demo/{1}/delete
  def delete
    @demo = Demo.find(@params['id'])
    @demo.destroy if @demo
    redirect :action => :index  
  end
  
  def updateRating
    demoid = @params['id']
    rating = @params['userRatingValue']
    redirect :controller => :Userrating, :action => :updateRating, :query => {:rating => rating, :demoid => demoid}        
  end
  
end
