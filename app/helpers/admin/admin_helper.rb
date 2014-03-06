module Admin::AdminHelper
  def inputs_field_set &block
    field_set_tag nil, class: :inputs, &block
  end

  def actions_field_set &block
    field_set_tag nil, class: :actions, &block
  end
end
