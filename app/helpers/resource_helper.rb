module ResourceHelper
  def header_admin_show_button(resource)
    return unless resource.present?
    if policy([:admin, resource]).show?
      link_to(bootstrap_icon("back"), polymorphic_path([:admin, resource]), class: "float-end btn btn-xs btn-outline-secondary")
    end
  end

  def header_admin_new_button(resource)
    return unless resource.present?
    if policy([:admin, resource]).new?
      link_to(bootstrap_icon("plus-circle-fill"), new_polymorphic_path([:admin, resource]), class: "float-end btn btn-xs btn-outline-primary")
    end
  end

  def header_admin_edit_button(resource)
    return unless resource.present?
    if policy([:admin, resource]).edit?
      link_to(bootstrap_icon("pencil-fill"), edit_polymorphic_path([:admin, resource]), class: "float-end btn btn-xs btn-outline-primary")
    end
  end

  def header_admin_delete_button(resource)
    if policy([:admin, resource]).destroy? && !resource.try(:discarded?)
      return link_to(bootstrap_icon("trash-fill"), [:admin, resource], data: {turbo_confirm: "Are you sure?", turbo_method: :delete}, class: "float-end btn btn-xs btn-outline-danger")
    end

    if policy([:admin, resource]).try(:restore?) && resource.try(:discarded?)
      link_to(bootstrap_icon("unlock-fill"), polymorphic_path([:admin, resource], action: :restore), data: {turbo_confirm: "Are you sure?", turbo_method: :patch}, class: "float-end btn btn-xs btn-outline-warning")
    end
  end

  def header_show_button(resource)
    return unless resource.present?
    if policy(resource).show?
      link_to(bootstrap_icon("back"), polymorphic_path(resource), class: "float-end btn btn-xs btn-outline-secondary")
    end
  end

  def header_edit_button(resource)
    return unless resource.present?
    if policy(resource).edit?
      link_to(bootstrap_icon("pencil-fill"), edit_polymorphic_path(resource), class: "float-end btn btn-xs btn-outline-primary")
    end
  end
end