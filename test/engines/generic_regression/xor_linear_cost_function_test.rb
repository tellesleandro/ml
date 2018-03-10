require 'test_helper'

class XORLinearCostFunctionTest < ActiveSupport::TestCase

  setup do
    @b = var name: 'b'
    @w1 = var name: 'w1'; @x1 = var name: 'x1'
    @w2 = var name: 'w2'; @x2 = var name: 'x2'
    @dataset = [
      {@x1 => 0, @x2 => 0, Y: 0},
      {@x1 => 0, @x2 => 1, Y: 1},
      {@x1 => 1, @x2 => 0, Y: 1},
      {@x1 => 1, @x2 => 1, Y: 0}
    ]
    function = @b + @w1 * @x1 + @w2 * @x2
    @cost_function = GenericRegression::CostFunction.new(function)
  end

  test "should calculate mse" do
    mse = @cost_function.mse @dataset
    assert_equal(
      {
        @b => (2 * @b + @w1 + @w2 - 1),
        @w1 => (@b + @w1 + 0.5 * @w2 - 0.5),
        @w2 => (@b + 0.5 * @w1 + @w2 - 0.5)
      }, mse)
  end

  test "should minimize errors" do
    mse = @cost_function.mse @dataset
    parameters_initial_values = {
      @b => 1,
      @w1 => 0.1,
      @w2 => 0.1
    }
    learning_rate = 0.1
    cost_function_minimized = @cost_function.minimize(mse, parameters_initial_values, learning_rate)
    assert_in_delta(
      cost_function_minimized.subs({@x1 => 0, @x2 => 0}), 0.5, 0.01
    )
    assert_in_delta(
      cost_function_minimized.subs({@x1 => 0, @x2 => 1}), 0.5, 0.01
    )
    assert_in_delta(
      cost_function_minimized.subs({@x1 => 1, @x2 => 0}), 0.5, 0.01
    )
    assert_in_delta(
      cost_function_minimized.subs({@x1 => 1, @x2 => 1}), 0.5, 0.01
    )
  end

end
