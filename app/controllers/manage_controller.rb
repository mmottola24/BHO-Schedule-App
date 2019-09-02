class ManageController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin

  def index

  end
end