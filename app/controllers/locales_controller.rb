class LocalesController < ApplicationController
  def change
    session[:locale] = params[:locale]
    redirect_to :back, :locale => params[:locale]
  end
end