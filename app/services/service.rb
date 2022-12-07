# frozen_string_literal: true

class Service
  private

  def init_instance_vars(params, param_vars)
    param_vars.each { |param| instance_variable_set("@#{param}", params[param]) }
  end
end
