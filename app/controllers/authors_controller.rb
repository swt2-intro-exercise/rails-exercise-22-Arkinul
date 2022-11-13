class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end
  def create
    @author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name], homepage: params[:author][:homepage])
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end

  end
  #show action
  def show
    @author = Author.find(params[:id])

  end
  def index
    @authors = Author.all
  end
end
