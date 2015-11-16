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
  end

  def create
      @record = Record.new(record_params)
      @record.dateajout = Time.now.to_time.to_i
      if @record.save
        redirect_to page_detail_path(:id => @record.id)
      else
        render :new
      end
  end

  def update
  end

  def destroy
  end

  def record_params
    params.require(:record).permit(:nom, :nomoriginal, :annee, :genre, :realisateur, :nationalite, :duree, :acteur, :resume, :img_small, :img_big, :dateajout)
  end



end