class OwnersController < ApplicationController
  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      render json: @owner, status: :created
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:name)
  end
end