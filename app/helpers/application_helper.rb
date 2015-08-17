module ApplicationHelper
  def new_button_link(model_class)
    model_name = model_class.model_name
    button_link("New #{model_name.name}", new_polymorphic_path(model_name.element), 'btn-info')
  end

  def back_button_link(model_class)
    tag('br') +
      button_link('Back', polymorphic_path(model_class), 'btn-danger')
  end

  def edit_page_bottom_links(model)
    out = tag('br')
    out << back_button_link(model.class)
    out << " "
    out << show_button_link(model)
    return out
  end

  def show_page_bottom_links(model)
    out = tag('br')
    out << back_button_link(model.class)
    out << " "
    out << edit_button_link(model)
    return out
  end

  def table_button_links(model, *parents)
    edit_button_link(model, *parents) + " " + destroy_button_link(model, *parents)
  end

  def button_link(name, path, style, **additional)
    link_to name, path, role: 'button', class: "btn #{style} btn-xs", **additional
  end

  private
    def edit_button_link(model, *parents)
      button_link('Edit', edit_polymorphic_path([*parents, model]), 'btn-success')
    end

    def show_button_link(model)
      button_link('Show', model, 'btn-success')
    end

    def destroy_button_link(model, *parents)
      button_link('Destroy', [*parents, model], 'btn-danger', method: :delete, data: { confirm: 'Are you sure?' })
    end
end
