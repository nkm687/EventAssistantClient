require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PresenterController < Rho::RhoController
  include BrowserHelper

  # GET /Presenter
  def index
    @presenters = Presenter.find(:all)
    render :back => '/app'
  end

  # GET /Presenter/{1}
  def show
    @presenter = Presenter.find(@params['id'])
    if @presenter
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Presenter/new
  def new
    @presenter = Presenter.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Presenter/{1}/edit
  def edit
    @presenter = Presenter.find(@params['id'])
    if @presenter
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Presenter/create
  def create
    @presenter = Presenter.create(@params['presenter'])
    redirect :action => :index
  end

  # POST /Presenter/{1}/update
  def update
    @presenter = Presenter.find(@params['id'])
    @presenter.update_attributes(@params['presenter']) if @presenter
    redirect :action => :index
  end

  # POST /Presenter/{1}/delete
  def delete
    @presenter = Presenter.find(@params['id'])
    @presenter.destroy if @presenter
    redirect :action => :index  
  end
end
