class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end
  def create
    @author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name], homepage: params[:author][:homepage])
    @author.save
    redirect_to root_path
  end
end
