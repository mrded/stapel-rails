module Stapel
  module Rails
    require "stapel/rails/engine" if defined?(Rails)
  end

  class Items < AbstractController::Base
    attr_accessor :items, :options

    include AbstractController::Rendering
    include AbstractController::Helpers
    self.view_paths << "app/views"

    def initialize(options = [])
      @options = options
      @items = []
    end

    def add(item)
      item[:tags].each do |tag|
        item[:tag] = tag
        @items << item.clone
      end
    end

    def show
      render partial: "stapel-rails/show"
    end
  end
end
