class Api::AuthorsController < ApplicationController

  # GET /api/authors  
  def index
    render json: Author.all
   end

  # POST /api/authors  
  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author
    else
      render json: @author.errors, status: 400
    end 
  end

  # GET /api/authors/:id
  def show
    render json: Author.find(params[:id])
  end

  # PUT /api/authors/:id
  def update
    Author.find(params[:id]).update(author_params)
  end

  # DELETE /api/authors/:id
  def destroy
    Author.find(params[:id]).destroy
  end
  

  private

  def author_params
    params.require(:author).permit(:name, :image)
  end
  
end