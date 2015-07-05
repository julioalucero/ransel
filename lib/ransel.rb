require "ransel/version"
require 'ransel/action_view/helpers'
require 'ransel/rendered'
require 'ransel/railtie' if defined?(Rails)

module Ransel

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :root_url_text
    attr_accessor :separator
    attr_accessor :root_path
    attr_accessor :primary_search
    attr_accessor :secondary_search
    attr_accessor :secondary_search_text


    def initialize
      @root_url_text = 'init'
      @separator = ' < '
      @root_path = '/'
      @primary_search = 'title_cont'
      @secondary_search = 'estate_traceability_true'
      @secondary_search_text = 'With Traceability'
    end

  end

end