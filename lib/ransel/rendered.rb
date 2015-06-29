module Ransel

  class Rendered
    attr_accessor :configuration

    def initialize(search_pattern)
      @search_pattern = search_pattern
      @configuration = Ransel::Configuration.new
    end

    def generate_breadcrums
      breadcrums = root_link

      if has_principal_search?
        breadcrums += @configuration.separator
        breadcrums += principal_link
      end

      breadcrums
    end

    private

    def root_link
      "<a href=#{@configuration.root_path}>#{@configuration.root_url_text}</a>"
    end

    def principal_link
      "<a href=/?q[#{@configuration.principal_search}]=#{@search_pattern[@configuration.principal_search]}>#{@search_pattern[@configuration.principal_search]}</a>"
    end

    def has_principal_search?
      @search_pattern[@configuration.principal_search].size > 0
    end

  end

end