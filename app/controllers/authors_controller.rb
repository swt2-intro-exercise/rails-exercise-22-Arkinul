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

  def edit
    @author = Author.find(params[:id])
  end
  #update author with id

  def update
    @author = Author.find(params[:id])
    if params[:author][:first_name] != nil
      author_params = params.require(:author).permit(:first_name, :last_name, :homepage)
      if @author.update(author_params)
        redirect_to author_path(@author)
      else
        render :edit
      end
    end
  end
  #delete author with id
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end
end
