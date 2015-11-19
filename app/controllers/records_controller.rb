class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def show
    redirect_to page_detail_path(:record.id)
  end

  def new
    @record = Record.new
  end

  def edit
      redirect_to page_edit_path(:id => @record.id)
  end

  def create
      @record = Record.new(record_params)

      #pull the image from the specified url and set the record's img_small
      @record.img_small_from_url(params[:record][:img_small_url])
      @record.img_big_from_url(params[:record][:img_big_url])

      @record.dateajout = Time.now.to_time.to_i

      if @record.save
        redirect_to page_detail_path(:id => @record.id)
      else
        render :new
      end
  end

  def update
    @record = Record.find(params[:record][:id])
    if @record.update_attributes(record_params)
      redirect_to page_detail_path(:id => @record.id)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def record_params
    params.require(:record).permit(:nom, :nomoriginal, :annee, :genre, :realisateur, :nationalite, :duree, :acteur, :resume, :img_small, :img_big, :dateajout)
  end



end