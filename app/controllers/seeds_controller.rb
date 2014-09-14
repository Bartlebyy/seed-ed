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
    @seed[:volunteers] = "#{[10, 30, 50, 70, 80, 85, 90, 95, 100].sample}" + "%"
    @seed[:money] = "#{[10, 30, 50, 70, 80, 85, 90, 95, 100].sample}" + "%"
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
