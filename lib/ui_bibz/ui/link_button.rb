module UiBibz::Ui
  class LinkButton < Ui

    def initialize content = nil, options = nil, html_options = nil, &block
      @link_button = Component.new content, options, html_options, &block
    end

    def render
      link_to @link_button.render, @link_button.options, class_and_html_options
    end

    def type
      custom = @link_button.html_options[:type] || @link_button.options[:type]
      custom.nil? ? states[:default] : states[custom]
    end

    def class_and_html_options
      @link_button.class_and_html_options(["btn", type])
    end

    def states
      if @states.nil?
        states = {}
        %w(default success primary info waring danger).each do |state|
          states = states.merge(Hash[state.to_sym, "btn-#{ state }"])
        end
        @states = states
      end
      @states
    end

  end
end