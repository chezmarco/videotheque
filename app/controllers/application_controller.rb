class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_filter :set_data

  def hello
    render text: "hello, world!"
  end

  private      
  def capitalize_first_letter(s)
    s.nil? ? s : s.split.map(&:capitalize)*' '
  end

  def treat(a)
    a.sort!.reject{ |s| s.empty? }
  end

    def set_data

      @allrecords = Record.all
      @genres = Array.new
      @acteurs = Array.new
      @realisateurs = Array.new
      @nationalites = Array.new
      @annees = Array.new

      @allrecords.each do |record|
        @genres += record.genre.nil? ? [] : record.genre.split(",").map{ |s| capitalize_first_letter(s.strip)}
        @acteurs += record.acteur.nil? ? [] : record.acteur.split(",").map{ |s| capitalize_first_letter(s.strip)}
        @realisateurs += record.realisateur.nil? ? [] : record.realisateur.split(",").map{ |s| capitalize_first_letter(s.strip)}
        @nationalites += record.nationalite.nil? ? [] : record.nationalite.split(",").map{ |s| capitalize_first_letter(s.strip)}
        @annees += record.annee.nil? ? [] : [record.annee]
      end

      @genres = treat(@genres.uniq.nil? ? @genres : @genres.uniq)
      @acteurs = treat(@acteurs.uniq.nil? ? @acteurs : @acteurs.uniq)
      @realisateurs = treat(@realisateurs.uniq.nil? ? @realisateurs : @realisateurs.uniq)
      @nationalites = treat(@nationalites.uniq.nil? ? @nationalites : @nationalites.uniq)
    end


end
