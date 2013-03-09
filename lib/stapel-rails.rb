module Stapel
  module Rails
    require "stapel/rails/engine" if defined?(Rails)
  end

  class Items
    include Sprockets::Helpers::RailsHelper
    include Sprockets::Helpers::IsolatedHelper

    def initialize(options = {})
      @options = options
      @items = []
      @id = rand(36**8).to_s(36)
    end

    def add(item)
      item[:tags].each do |tag|
        item[:tag] = tag
        @items << item.clone
      end
    end

    def prepare
      @html = Nokogiri::HTML::DocumentFragment.parse ""
      Nokogiri::HTML::Builder.with(@html) do | doc |
        doc.div(class: "stapel") {
          # Set options for JavaScript
          doc.div class: 'stapel-options', 'data-options' => @options.to_json

          doc.div(class: "topbar") {
            doc.span 'X', id: 'close', class: "back"
            doc.h3 class: "name"
          }

          doc.ul(id: "tp-grid", class: "tp-grid") {
            @items.each do | item |
              doc.li('data-pile' => item[:tag]) {
                doc.a(href: item[:link]) {
                  doc.span(class: "tp-info") {
                    doc.span item[:title]
                  }

                  doc.img src: asset_path(item[:image])
                }
              }
            end
          }
        }
      end
    end

    def html
      #CGI::unescapeHTML(@html.to_html.html_safe)
      @html.to_html.html_safe
    end
  end
end
