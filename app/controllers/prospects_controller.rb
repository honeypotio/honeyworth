class ProspectsController < ApplicationController
  def new
    @prospect = Prospect.new
  end

  def create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save 
      flash[:success] = "Thank you! We received your profile and will get back to you with your salary report within 72 hours via email."
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
