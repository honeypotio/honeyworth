class ProspectsController < ApplicationController
  def new
    @prospect = Prospect.new
  end

  def create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save 
      flash[:success] = "Profile submitted!"
      redirect_to root_url
    else
      render 'new'
    end
  end


  private
    def prospect_params
      params.require(:prospect).permit(:email, :profile_link, :dev_link)
    end
end
