class AnalyticsController < ApplicationController
  skip_before_action :authenticated, only: [:index]

  def index

  end
end
