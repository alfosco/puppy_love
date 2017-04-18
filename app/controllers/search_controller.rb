class SearchController < ApplicationController
  before_action :authorize!
  
  def index
    @zip_code = params[:search]
    @dogs = Dog.find_by_zip(@zip_code)
  end
end
