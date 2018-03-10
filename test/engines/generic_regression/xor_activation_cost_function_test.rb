require 'test_helper'

class XORActivationCostFunctionTest < ActiveSupport::TestCase

  setup do
    @b = var name: 'b'
    # @b1 = var name: 'b1', @b2 = var name: 'b2'
    @w1 = var name: 'w1'; @w2 = var name: 'w2'
    @w11 = var name: 'w11'; @w12 = var name: 'w12'
    @w21 = var name: 'w21'; @w22 = var name: 'w22'
    @x1 = var name: 'x1'; @x2 = var name: 'x2'
    # @b1 = var(name: 'b1'){[0, @w11 * @x1 + @w21 * @x2].max}
    # @b2 = var(name: 'b2'){[0, @w21 * @x1 + @w22 * @x2].max}
    @b1 = @w11 * @x1 + @w21 * @x2
    @b2 = @w12 * @x1 + @w22 * @x2
    function = @b + @w1 * @b1 + @w2 * @b2
    @cost_function = GenericRegression::CostFunction.new(function)
    @dataset = [
      {@x1 => 0, @x2 => 0, Y: 0},
      {@x1 => 0, @x2 => 1, Y: 1},
      {@x1 => 1, @x2 => 0, Y: 1},
      {@x1 => 1, @x2 => 1, Y: 0}
    ]
  end

  # test "should calculate mse" do
  #   mse = @cost_function.mse @dataset
  #   assert_equal(
  #     {
  #       @b => 2 * @b + (@w21 * @w1) + (@w22 * @w2) + (@w11 * @w1) + (@w12 * @w2) - 1.0,
  #       @w1 => -0.5 * @w21 + 0.5 * (@b * @w21) + 0.5 * (@w21 ** 2 * @w1) + 0.5 * (@w22 * @w2 * @w21) - 0.5 * @w11 + 0.5 * (@b * @w11) + 0.5 * (@w11 ** 2 * @w1) + 0.5 * (@w12 * @w2 * @w11) + 0.25 * ((2 * @b + 2 * (@w11 * @w1) + 2 * (@w21*@w1) + 2 * (@w12*@w2) + 2 * (@w22 * @w2)) * (@w11 + @w21)),
  #       @w2 => -0.5 * @w22 + 0.5 * (@b * @w22) + 0.5 * (@w21 * @w1 * @w22) + 0.5 * (@w22 ** 2 * @w2) - 0.5 * @w12 + 0.5 * (@b * @w12) + 0.5 * (@w11 * @w1 * @w12) + 0.5 * (@w12 ** 2 * @w2) + 0.25 * ((2 * @b + 2 * (@w11 * @w1) + 2 * (@w21 * @w1) + 2 * (@w12 * @w2) + 2 * (@w22 * @w2)) * (@w12 + @w22)),
  #       @w11 => -0.5 * @w1 + 0.5 * (@w21 * @w1 ** 2) + 0.5 * (@w22 * @w2 * @w1) + (@b * @w1) + (@w11 * @w1 ** 2) + (@w12 * @w2 * @w1),
  #       @w12 => -0.5 * @w2 + 0.5 * (@w21 * @w1 * @w2) + 0.5 * (@w22 * @w2 ** 2) + (@b * @w2) + (@w11 * @w1 * @w2) + (@w12 * @w2 ** 2),
  #       @w21 => -0.5 * @w1 + 0.5 * (@w11 * @w1 ** 2) + 0.5 * (@w12 * @w2 * @w1) + (@b * @w1) + (@w21 * @w1 ** 2) + (@w22 * @w2 * @w1),
  #       @w22 => -0.5 * @w2 + 0.5 * (@w11 * @w1 * @w2) + 0.5 * (@w12 * @w2 ** 2) + (@b * @w2) + (@w21 * @w1 * @w2) + (@w22 * @w2 ** 2)
  #     }, mse
  #   )
  # end

  # test "should minimize errors" do
  #   mse = @cost_function.mse @dataset
  #   parameters_initial_values = {
  #     @b => 1,
  #     @w1 => 0.1, @w2 => 0.1,
  #     @w11 => 0.1, @w12 => 0.1,
  #     @w21 => 0.1, @w22 => 0.1,
  #   }
  #   learning_rate = 0.1
  #   cost_function_minimized = @cost_function.minimize(mse, parameters_initial_values, learning_rate)
  #   p 'a'
  #   p cost_function_minimized
  #   p 'b'
  #   # assert_in_delta(
  #   #   cost_function_minimized.subs({@x1 => 1, @x2 => 1}), 0, 0.01
  #   # )
  # end

end
