class PagesController < ApplicationController
  before_action :handle_authorization

  # GET /contact
  def contact
  end

  # GET /events
  def events
    @david = ::User.find(Settings.user.david)
  end

  # GET /
  def home
  end

  private

  def handle_authorization
    authorize(:page)
  end
end
