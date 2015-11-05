class PageController < ApplicationController

  def capitalize_first_letter(s)
    s.nil? ? s : s.split.map(&:capitalize)*' '
  end

  def treat(a)
    a.sort!.reject{ |s| s.empty? }
  end

  helper_method :capitalize_first_letter, :treat
  
  def home
    if params[:genre]
      @records = Record.where("genre like ?",  "%#{params[:genre]}%")
    elsif params[:realisateur]
      @records = Record.where("realisateur like ?",  "%#{params[:realisateur]}%")
    elsif params[:acteur]
      @records = Record.where("acteur like ?",  "%#{params[:acteur]}%")
    elsif params[:search]
      @records = Record.where("acteur like ? or nom like ? or nomoriginal like ? or realisateur like ? or genre like ? or annee like ? or nationalite like ?",  
        "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%",  "%#{params[:search]}%", "%#{params[:search]}%")
    else
    	@records = Record.all
    end
  end

  def detail
  	@record = Record.find(params[:id])
  end


end
