class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_charset

  def set_locale
    I18n.locale = session[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {:locale => I18n.locale}
  end

  private
  def extract_locale_from_accept_language_header
    if request.env['HTTP_ACCEPT_LANGUAGE']
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
  end

  def set_charset
    @headers["Content-Type"] = "text/html; charset=utf-8"
  end

end
