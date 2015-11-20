module PageHelper
  
  def create_home_path( option = {} )
    if option[:sort].nil?
      option[:sort] = session[:sort]
    else
      if params[:genre]
        option[:genre] = params[:genre]
      elsif params[:realisateur]
        option[:realisateur] = params[:realisateur]
      elsif params[:acteur]
        option[:acteur] = params[:acteur]
      elsif params[:nationalites]
        option[:nationalites] = params[:nationalites]
      end
    end

    page_home_path( option ) 
  end

end
