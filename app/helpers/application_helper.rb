module ApplicationHelper
  def new_button_link(model_class)
    model_name = model_class.model_name
    button_link("New #{model_name.name}", new_polymorphic_path(model_name.element), 'btn-info')
  end

  def edit_button_link(model)
    button_link('Edit', edit_polymorphic_path(model), 'btn-success')
  end

  def show_button_link(model)
    button_link('Show', model, 'btn-success')
  end

  def back_button_link(model_class)
    button_link('Back', polymorphic_path(model_class), 'btn-danger')
  end

  def destroy_button_link(model)
    button_link('Destroy', model, 'btn-danger', method: :delete, data: { confirm: 'Are you sure?' })
  end

  def edit_page_bottom_links(model)
    back_button_link(model.class) + " " +
    show_button_link(model)
  end

  def show_page_bottom_links(model)
    back_button_link(model.class) + " " +
    edit_button_link(model)
  end
  private
  def button_link(name, path, style, **additional)
    link_to name, path, role: 'button', class: "btn #{style} btn-xs", **additional
  end
end
