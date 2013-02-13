# require "stapel-rails/version"

module Stapel
  module Rails
    require "stapel/rails/engine" if defined?(Rails)

    class Stapel < AbstractController::Base
      attr_accessor :items, :options

      include AbstractController::Rendering
      include AbstractController::Helpers

      self.view_paths << "app/views"

      def initialize
        @items = @options = []
      end

      def show
        render :partial => "stapel-rails/show"
      end
    end
  end
end
