module DjMon
  class DjReportsController < ActionController::Base
    respond_to :json
    layout 'dj_mon'
    
    before_filter :authenticate

    def index
    end

    def all
      respond_with DjReport.all
    end

    def failed
      respond_with DjReport.failed
    end

    def active
      respond_with DjReport.active
    end

    def queued
      respond_with DjReport.queued
    end

    protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.configuration.dj_mon.username &&
        password == Rails.configuration.dj_mon.password
      end
    end
  end

end