require 'test_helper'

require 'Matrix'

class ScalarsVectorsMatricesTest < ActiveSupport::TestCase

  setup do
    @a = Matrix.build(3){rand}
    @b = Matrix.build(3){rand}
    @c = Matrix.build(3){rand}
  end

  test "should add two matrices" do
    (@a + @b).each_with_index do |e, row, column|
      assert_equal e, (@a[row, column] + @b[row, column])
    end
  end

  test "should multiply two matrices" do
    (@a * @b).each_with_index do |e, row, column|
      row_vector = @a.row(row)
      column_vector = @b.column(column)
      value = 0
      row_vector.each_with_index{|v, index| value += v * column_vector[index]}
      assert_equal e, value
    end
  end

  test "should be distributive" do
    (@a * (@b + @c)).each_with_index do |e, row, column|
      # Running the tests we get a behavior for the multiplication
      # that makes the expected result different from the actual
      # result.
      # For example: Expected: 0.7572786133124992 Actual: 0.7572786133124993
      # So, we use delta for assertion
      assert_in_delta e, (@a * @b + @a * @c)[row, column], 0.001
    end
  end

  test "should be associative" do
    (@a * (@b * @c)).each_with_index do |e, row, column|
      # Running the tests we get a behavior for the multiplication
      # that makes the expected result different from the actual
      # result.
      # For example: Expected: 0.1570335909688006 Actual: 0.15703359096880062
      # So, we use delta for assertion
      assert_in_delta e, ((@a * @b) * @c)[row, column], 0.001
    end
  end

end
