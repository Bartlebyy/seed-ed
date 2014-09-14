class SeedsController < ApplicationController
  def index
    @seeds = Seed.all.order(updated_at: :asc)
  end

  def show
    @seed = Seed.find(params[:id])
  end

  def new
    @seed = Seed.new
  end

  def create
    @seed = Seed.new(params.require(:seed).permit(:title, :creator, :image_url, :description, :tags))
    @seed[:volunteers] = [10, 25, 50, 60, 75, 80, 100].sample
    @seed[:money] = [10...99].sample
    @seed[:time_limit] = [1...30].sample
    if @seed.save
      render :show
    else
      render_invalid @seed
    end
  end

private

  def create_params
    params.require(:seed).
      permit(:title, :creator, :image_url, :description, :tag)
      #merge(created_by: current_user)
  end
end
