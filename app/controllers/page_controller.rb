class PageController < ApplicationController

  def capitalize_first_letter(s)
    s.nil? ? s : s.split.map(&:capitalize)*' '
  end

  def treat(a)
    a.sort!.reject{ |s| s.empty? }
  end

  helper_method :capitalize_first_letter, :treat
  
  def home
  	@records = Record.all
    @acteurs = Array.new
    @realisateurs = Array.new
    @genres = Array.new
    @nationalites = Array.new
    @annees = Array.new
  end

  def detail
  	@record = Record.find(params[:id])
  end


end
