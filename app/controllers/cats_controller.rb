class CatsController < ApplicationController
  # GET /cats
  def index
    @cats = Cat.all

    render json: @cats
  end

  # GET /cats/1
  # Follows convention that content type will correspond with method names and views
  def show
    begin
      @cat = CatService.new.send("get#{accepted_method}", params[:id])
    rescue NoMethodError
      return render body: "Unsupported content type #{get_content_type}", status: :bad_request
    end

    render "show#{accepted_view}"
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: @cat, status: :created, location: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/1
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      render json: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cats/1
  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def cat_params
    params.require(:cat).permit(:name, :age, :owner_id)
  end
end
