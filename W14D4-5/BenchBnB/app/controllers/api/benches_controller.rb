class Api::BenchesController < ApplicationController
  def create
    @bench = Bench.new(bench_params)

    if @bench.save 
      render 'api/benches/show'
    else 
      render json: @bench.errors.full_messsages
    end 
  end

  def index
    # debugger
    if params[:bounds] 
      @benches = Bench.in_bounds(params[:bounds])
    else
      @benches = Bench.all 
    end 
    render 'api/benches/index'
  end

  def bench_params
    parmas.require(:bench).permit(:description, :lat, :lng)
  end 
end
