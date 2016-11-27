class PeriodsController < ApplicationController
  before_action :period, except: [:index, :new, :create]

  def index
    @periods = Period.all
  end

  def edit
  end

  def update
    if @period.update(period_params)
      flash[:success] = 'Period updated'
      redirect_to period_path(@period)
    else
      flash[:error] = 'No update'
      render :new
    end
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)
    if @period.save
      flash[:success] = 'Period created'
      redirect_to period_path(@period)
    else
      flash[:error] = 'No period'
      render :new
    end
  end

  def show
  end

  def destroy
    @period.destroy
    flash[:success] = 'Period created'
    redirect_to periods_path
  end

  private
    def period
      @period = Period.find(params[:id])
    end

    def period_params
      params.require(:period).permit(:title, :students)
    end
end
