class Service
  attr_reader :object, :params

  def initialize(object, params)
    @object = object
    @params = params
  end

  class << self
    def call(object, **params)
      new(object, **params).call
    end
  end
end
