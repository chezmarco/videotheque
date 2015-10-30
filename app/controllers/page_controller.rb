class PageController < ApplicationController
  def home
  	@records = Record.all
  end
  def detail
  	@record = Record.find(params[:myparam])
  end
end
