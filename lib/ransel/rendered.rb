module Ransel

  class Rendered
    attr_accessor :configuration

    def initialize(search_pattern)
      @search_pattern = search_pattern
      @configuration = Ransel::Configuration.new
    end

    def generate_breadcrums
      breadcrums = root_link

      if has_primary_search?
        breadcrums += @configuration.separator
        breadcrums += primary_link
      end

      if has_secondary_search?
        breadcrums += @configuration.separator
        breadcrums += secondary_link
      end

      breadcrums
    end

    private

    def root_link
      "<a href=#{@configuration.root_path}>#{@configuration.root_url_text}</a>"
    end

    def primary_link
      "<a href=/?q[#{@configuration.primary_search}]=#{@search_pattern[@configuration.primary_search]}>#{@search_pattern[@configuration.primary_search]}</a>"
    end

    def secondary_link
      "<a href=/?q[#{@configuration.secondary_search}]=#{@search_pattern[@configuration.secondary_search]}>#{@configuration.secondary_search_text}</a>"
    end

    def has_primary_search?
      @search_pattern[@configuration.primary_search].size > 0
    end

    def has_secondary_search?
      !@search_pattern[@configuration.secondary_search].nil? and @search_pattern[@configuration.secondary_search].size > 0
    end

  end

end