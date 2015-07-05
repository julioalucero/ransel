require 'spec_helper'

describe Ransel::ActionView::Helpers do
  let!(:configuration) { Ransel::configuration }

  describe 'empty search' do
    let!(:search_pattern) { { "title_cont" => "" } }
    let!(:ransel)         { Ransel::Rendered.new(search_pattern) }

    it 'returns the root_path link' do
      expect(
        ransel.generate_breadcrums
      ).to eq("<a href=#{configuration.root_path}>#{configuration.root_url_text}</a>")
    end

  end

  describe 'primary search' do
    let!(:search_pattern) { { configuration.primary_search => "bla" } }
    let!(:ransel)         {  Ransel::Rendered.new(search_pattern) }

    it 'returns two links, on to root and other to the text search' do
      expect(
        ransel.generate_breadcrums
      ).to eq(
      "<a href=#{configuration.root_path}>#{configuration.root_url_text}</a>" +
      ransel.configuration.separator +
      "<a href=/?q[#{configuration.primary_search}]=#{search_pattern[configuration.primary_search]}>#{search_pattern[configuration.primary_search]}</a>"\
      )
    end
  end

  describe 'secondary search' do
    let!(:search_pattern) { { configuration.primary_search => "bla", configuration.secondary_search => 1 } }
    let!(:ransel)         {  Ransel::Rendered.new(search_pattern) }

    it 'returns three links, on to root and other two with primary and seconday search' do
      expect(
        ransel.generate_breadcrums
      ).to eq(
      "<a href=#{configuration.root_path}>#{configuration.root_url_text}</a>" +
      configuration.separator +
      "<a href=/?q[#{configuration.primary_search}]=#{search_pattern[configuration.primary_search]}>#{search_pattern[configuration.primary_search]}</a>" +
      configuration.separator +
      "<a href=/?q[#{configuration.secondary_search}]=#{search_pattern[configuration.secondary_search]}>#{configuration.secondary_search_text}</a>"
      )
    end
  end

end