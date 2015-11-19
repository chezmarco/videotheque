class PageController < ApplicationController

  def capitalize_first_letter(s)
    s.nil? ? s : s.split.map(&:capitalize)*' '
  end

  def treat(a)
    a.sort!.reject{ |s| s.empty? }
  end

  helper_method :capitalize_first_letter, :treat
  
  def home

    @sort = "date"
    @sortorder = "dateajout DESC"
    @titlesortactive = ""
    @datesortactive = "active"

    if params[:sort]
      if params[:sort] == "title"
        @sort = "title"
        @sortorder = "nom ASC"
        @titlesortactive = "active"
        @datesortactive = ""
      end
    end

    if params[:genre]
      @records = Record.where("LOWER(genre) LIKE ?",  "%#{params[:genre].downcase}%").order(@sortorder)
    elsif params[:realisateur]
      @records = Record.where("LOWER(realisateur) LIKE ?",  "%#{params[:realisateur].downcase}%").order(@sortorder)
    elsif params[:acteur]
      @records = Record.where("LOWER(acteur) LIKE ?",  "%#{params[:acteur].downcase}%").order(@sortorder)
    elsif params[:search]
      @records = Record.where("LOWER(acteur) LIKE ? OR LOWER(nom) LIKE ? OR LOWER(nomoriginal) LIKE ? 
        OR LOWER(realisateur) LIKE ? OR LOWER(genre) LIKE ? OR CAST(annee AS text) LIKE ? OR LOWER(nationalite) LIKE ?",  
        "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%",  
        "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%",  "%#{params[:search].downcase}%", 
        "%#{params[:search].downcase}%").order(@sortorder)
    else
    	@records = Record.order(@sortorder).all
    end
  end

  def detail
    @record = Record.find(params[:id])
  end

  def addfilm
    @record = Record.new
    #@titre = "Inscription"

    if params[:allocine]
      allocine(params[:allocine])
    else
      @allo_titre = ""
      @allo_titreoriginal = ""
      @allo_acteurs = ""
      @allo_realisateurs = ""
      @allo_annee = ""
      @allo_duree = ""
      @allo_genres = ""
      @allo_nationalites = ""
      @allo_synopsis = ""
      @allo_img_small = ""
      @allo_img_big = ""
    end

  end


  def allocine(allo_link)
      require 'rubygems'
      require 'nokogiri'   
      require 'open-uri'
      page = Nokogiri::HTML(open("#{allo_link}"))
      @allo = ""
      # page.css("div.expendTable table tr th div").each do |item|
      #   if !item.nil?
      #     #@allo += " || " + item.parent.text
      #     #puts item.text
      #     @allo += item.parent.next_element.nil? ? "" : " || " + item.parent.next_element.text
      #     #puts item.next_element.text
      #   end
      # end

      # page = Nokogiri::HTML(open("delme.html")) 

      #titre 
      @allo_titre = page.css('div#title span')[0].text
      #@allo += @allo_titre

      #acteurs
      tmp = []
      page.css('table.data_box_table tr td span[itemprop=actors]').each do |a|
        tmp << a.text
      end
      @allo_acteurs = tmp.join(", ")
      #@allo += " || " + @allo_actors

      #realisateur
      tmp = []
      page.css('table.data_box_table tr td span[itemprop=director]').each do |a|
        tmp << a.text
      end
      @allo_realisateurs = tmp.join(", ")
      #@allo += " || " + @allo_realisators

      #nom original
      tmp = page.css("div.expendTable table tr th div[text()='Titre original']").first
      @allo_titreoriginal = tmp.nil? ? "" : tmp.parent.next_element.text
      #@nomorig = page.css("div.expendTable table tr th div[text()='Titre original']").first.parent.next_element.text
      #@allo += " || " + @allo_titreorig

      #année
      @allo_annee = page.css('table.data_box_table tr td span[itemprop=datePublished]').first.text.split.last
      #@allo += " || " + @allo_annee

      #duree
      tmp = page.css('table.data_box_table tr td span[itemprop=duration]').first.text
      tmp1 = tmp.split('h')
      hour = tmp1.size == 2 ? tmp1[0] : "0" 
      minute = tmp1.size == 2 ? tmp1[1].gsub('min', '') : tmp1[0].gsub('min', '')
      @allo_duree = hour + "h" + minute
      #@allo += " || " + @allo_duree

      #genres
      tmp = []
      page.css('table.data_box_table tr td span[itemprop=genre]').each do |a|
        tmp << a.text
      end
      @allo_genres = tmp.join(", ")
      #@allo += " || " + @allo_genres

      #nationalites
      tmp = page.css("div.data_box table.data_box_table tr th span[text()*='Nationalit']").first
      tmp1 = tmp.parent.next_element
      tmp2 = tmp1.text.split(',').map{ |element| element.strip.capitalize }
      @allo_nationalites = tmp2.join(", ")
      #@allo += " || " + @allo_nationalites.join(", ")

      #synopsis
      @allo_synopsis = page.css('div#col_main div p[itemprop=description]').first.parent.text
      #@allo += " || " + @allo_synopsis.html_safe

      #img_small
      tmp = page.css('div#col_main div.data_box div.img_side_content div.poster img[itemprop=image]').first
      #@img_small = tmp.nil? ? "NIL" : "prout"
      @allo_img_small = tmp["src"]
      #@allo += " || " + @allo_img_small

      #img_big
      @allo_img_big = @allo_img_small.gsub('160_240', '640_600')
      #@allo += " || " + @allo_img_big

  end




end
