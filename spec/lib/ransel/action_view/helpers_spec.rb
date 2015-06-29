require 'spec_helper'

describe Ransel::ActionView::Helpers do

  describe 'empty search' do
    let!(:search_pattern) { { "title_cont" => "" } }
    let!(:ransel)         { Ransel::Rendered.new(search_pattern) }

    it 'returns the root_path link' do
      expect(
        ransel.generate_breadcrums
      ).to eq("<a href=#{ransel.configuration.root_path}>#{ransel.configuration.root_url_text}</a>")
    end

  end

  describe 'text search' do
    let!(:search_pattern) { { "title_cont" => "bla" } }
    let!(:ransel)         {  Ransel::Rendered.new(search_pattern) }

    it 'returns two links, on to root and other to the text search' do
      expect(
        ransel.generate_breadcrums
      ).to eq(
      "<a href=#{ransel.configuration.root_path}>#{ransel.configuration.root_url_text}</a>" +
      ransel.configuration.separator +
      "<a href=/?q[#{ransel.configuration.principal_search}]=#{search_pattern[ransel.configuration.principal_search]}>#{search_pattern[ransel.configuration.principal_search]}</a>"\
      )
    end
  end
end