module React
  alias CellValue = Int32

  abstract class Cell
    @dependents = [] of ComputeCell

    def initialize(initial : CellValue)
      @value = initial
    end

    getter :value

    protected getter :dependents
  end

  class InputCell < Cell
    def value=(new_value : CellValue)
      @value = new_value
      @dependents.each(&.propagate)
      @dependents.each(&.fire_callbacks)
    end
  end

  class ComputeCell < Cell
    alias CallbackID = Int32

    @callbacks_given = 0
    @callbacks = {} of CallbackID => CellValue ->
    @last_callback_value : CellValue

    def initialize(input : Cell, &compute : CellValue -> CellValue)
      initialize(->{ compute.call(input.value) }, input)
    end

    def initialize(input1 : Cell, input2 : Cell, &compute : (CellValue, CellValue) -> CellValue)
      initialize(->{ compute.call(input1.value, input2.value) }, input1, input2)
    end

    private def initialize(@new_value : -> CellValue, *dependencies : Cell)
      super(@new_value.call)
      @last_callback_value = @value
      dependencies.each { |i| i.dependents << self }
    end

    def add_callback(&block : CellValue ->) : CallbackID
      @callbacks_given += 1
      @callbacks[@callbacks_given] = block
      @callbacks_given
    end

    def remove_callback(id : CallbackID)
      @callbacks.delete(id)
    end

    protected def propagate
      new_value = @new_value.call
      return if new_value == @value
      @value = new_value
      @dependents.each(&.propagate)
    end

    protected def fire_callbacks
      return if @value == @last_callback_value
      @last_callback_value = @value
      @callbacks.each_value { |c| c.call(@value) }
      @dependents.each(&.fire_callbacks)
    end
  end
end
