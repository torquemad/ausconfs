class ConferencesController < ApplicationController

  def index
    @conferences = Conference.all
  end

	def show
		@conference = Conference.find params[:id]
	end

	def new
    @conference = Conference.new
	end

  def create
    @conference = Conference.new(conference_params)
    @conference.user = User.find(2) #until auth implemented

    if @conference.save
      flash[:success] = "Your conference has successfully been created."
      redirect_to conferences_path
    else
      render :new
    end
  end

	def edit
    @conference = Conference.find params[:id]
	end

	def update
    @conference = Conference.find params[:id]
    if @conference.update(conference_params)
      flash[:success] = "Your conference #{@conference.name} has successfully been updated."
      redirect_to conference_path(@conference)
    else
      render :edit
    end
	end

  private
    
  def conference_params
    params.require(:conference).permit(:name, :date, :summary, :description, :url, :picture)
  end

end
