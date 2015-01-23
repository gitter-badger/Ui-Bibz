module UiBibz::Helpers::UiHelper

  def panel *args, &block
    UiBibz::Ui::Panel.new(args).tap(&block).render
  end

  def nav content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Nav.new(content, options, html_options, &block).render
  end

  def tab content = nil, options = nil, html_options = nil, &block
    UiBibz::Ui::Tab.new(content, options, html_options, &block).render
  end

  def grid options = nil, html_options = nil, &block
    UiBibz::Ui::Grid.new(options, html_options).tap(&block).render
  end

  def dropdown name, options = nil, html_options = nil, &block
    UiBibz::Ui::Dropdown.new(name, options, html_options).tab(&block).render
  end

  def dropdown_button name, options = nil, html_options = nil, &block
    UiBibz::Ui::DropdownButton.new(name, options, html_options).tab(&block).render
  end
end