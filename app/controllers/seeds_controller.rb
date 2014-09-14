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
    @seed[:organization] = "North Atlanta High School"
    @seed[:time_limit] = [1...30].sample
    @seed[:votes] = [0...10].sample
    if @seed.save
      redirect_to @seed
    else
      render_invalid @seed
    end
  end

  def edit
    @seed = Seed.find(params[:id])
  end

  def update
    @seed = Seed.find(params[:id])
    if @seed.update update_params
      redirect_to @seed
    else
      render :edit
    end
  end

private

  def create_params
    params.require(:seed).
      permit(:title, :creator, :image_url, :description, :tag)
      #merge(created_by: current_user)
  end

  def update_params
    params.require(:seed).permit(:title, :creator, :image_url, :description, :tags, :organization, :volunteers, :money, :time_limit, :votes)
  end
end
