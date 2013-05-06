class TheatersController < ApplicationController

  def index
    @theaters = Theater.all
  end

  def show
    @theater = Theater.find_by_id(params[:id])
  end

  def new
    @theater = Theater.new
  end

  def create
    @theater = Theater.new
    @theater.name = params[:name]
    @theater.address = params[:address]

    if @theater.save                #QUESTION??? WHY IF STATEMENT???
      redirect_to "/theaters"
    else
      render 'new'
    end
  end

  def edit
    @theater = Theater.find_by_id(params[:id]) # fix id - "movie_id" to "id"
  end

  def update
    @theater = Theater.find_by_id(params[:id])
    @theater.name = params[:name] # added code to store data in database
    @theater.address = params[:address] # added code to store data in database

    if @theater.save                #QUESTION??? WHY IF STATEMENT???
      redirect_to "/theaters"
    else
      render 'edit'
    end
  end

  def destroy
    @theater = Theater.find_by_id(params[:id])
    @theater.destroy #added code to delete data
    redirect_to "/theaters"
  end
end
