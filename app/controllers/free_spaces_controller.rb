class FreeSpacesController < ApplicationController

  def show # ?
    @free_space = FreeSpace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @free_space }
    end
  end

end

