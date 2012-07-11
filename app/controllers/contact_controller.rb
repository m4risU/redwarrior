class ContactController < ApplicationController
  layout "wide"

  def index
    @hide_side_menu = true
  end
end
