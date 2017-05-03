class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  class Entry
  def initialize(title, link)
    @title = title
    @link = link
  end
  attr_reader :title
  attr_reader :link
  end

  def scrape_reddit
    require 'open-uri'
    require 'openssl'
doc = Nokogiri::HTML(open('https://www.reddit.com/r/writingprompts', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))


    entries = doc.css('.entry')
    @entriesArray = []
    entries.each do |entry|
      title = entry.css('p.title>a').text
      link = entry.css('p.title>a')[0]['href']
      @entriesArray << Entry.new(title, link)
    end

    render template: 'scrape_reddit'
  end
end
