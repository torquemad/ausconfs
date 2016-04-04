class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  before_action :require_identical_user, only: [:edit, :update]

  def index
    @conferences = Conference.all
  end

	def show
	end

	def new
    @conference = Conference.new
	end

  def create
    @conference = Conference.new(conference_params)
    @conference.user = current_user 

    if @conference.save
      flash[:success] = "Your conference has successfully been created."
      redirect_to conferences_path(current_user)
    else
      render :new
    end
  end

	def edit
	end

	def update
    if @conference.update(conference_params)
      flash[:success] = "Your conference #{@conference.name} has successfully been updated."
      redirect_to conference_path(@conference)
    else
      render :edit
    end
	end

  private
    
  def conference_params
    params.require(:conference).permit(:name, :date, :summary, :description, :url)
  end

  def set_conference
		@conference = Conference.find params[:id]
  end

  def require_identical_user
    if current_user != @conference.user
      flash[:danger] = "You cannot edit this"
      redirect_to conference_path
    end
  end

end
