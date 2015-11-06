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
      @records = Record.where("LOWER(genre) LIKE ?",  "%#{params[:genre].downcase}%")
    elsif params[:realisateur]
      @records = Record.where("LOWER(realisateur) LIKE ?",  "%#{params[:realisateur.downcase]}%")
    elsif params[:acteur]
      @records = Record.where("LOWER(acteur) LIKE ?",  "%#{params[:acteur.downcase]}%")
    elsif params[:search]
      @records = Record.where("LOWER(acteur) LIKE ? OR LOWER(nom) LIKE ? OR LOWER(nomoriginal) LIKE ? 
        OR LOWER(realisateur) LIKE ? OR LOWER(genre) LIKE ? OR LOWER(annee) LIKE ? OR LOWER(nationalite) LIKE ?",  
        "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%",  
        "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%", 
        "%#{params[:search].downcase}%")
    else
    	@records = Record.all
    end
  end

  def detail
  	@record = Record.find(params[:id])
  end


end
