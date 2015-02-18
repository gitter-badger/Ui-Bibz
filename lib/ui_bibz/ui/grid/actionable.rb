module UiBibz::Ui
  class Actionable < Ui

    def initialize store, options, actions = nil
      @store   = store
      @options = options
      @actions = actions
    end

    def actionable?
      @options[:actionable].nil? ? true : @options[:actionable]
    end

    def header ths
      ths << content_tag(:th, '', class: 'action') if actionable?
      ths
    end

    def body record, tds
      tds << td_action(record) if actionable?
      tds
    end

    # Add "id" in url to match with current record
    def inject_url url, record
      url.gsub(/(\/id\/?)/, "/#{ record.id }/")
    end

  private

    def dropdown_action record
      Dropdown.new 'Action', { position: :right, glyph: { name: 'ellipsis-v', size: 1, type: 'fw' }}, class: 'btn-group-xs' do |d|
        content_tag :li, actions_links(record), role: 'presentation'
      end.render
    end

    def actions_links record
      custom_actions(record) || default_actions(record)
    end

    def default_actions record
      capture do
        concat link_to action_name('eye', 'Show'), { controller: @store.controller, action: 'show', id: record.id }, role: "menuitem",  tabindex: "-1"
        concat link_to action_name('pencil', 'Edit'), { controller: @store.controller, action: 'edit', id: record.id }, role: "menuitem",  tabindex: "-1"
        concat link_to action_name('trash', 'Delete'), { controller: @store.controller, id: record.id }, method: :delete, data: { confirm: 'Are you sure?' }, role: "menuitem",  tabindex: "-1"
      end
    end

    def action_name glyph_name, name
      glyph = Glyph.new(name: glyph_name, type: 'fw').render
      "#{ glyph } #{ name }".html_safe
    end

    def custom_actions record
      @actions.split("\n").compact.map{ |l| inject_url(l, record) }.join().html_safe unless @actions.nil?
    end

    def td_action record
      content_tag :td, dropdown_action(record)
    end

  end
end