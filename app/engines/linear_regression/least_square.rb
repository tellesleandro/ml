module LinearRegression

  class LeastSquare

    def initialize(training_set)
      @training_set = training_set
    end

    # Calculate the parameters (teta_0 and teta_1) that fit better the
    # training set.
    def parameters

      # Calculate the average of X's
      x_average = average('x')

      # Calculate the average of Y's
      y_average = average('y')

      # Calculate teta_1 (that will be used to calculate teta_0)
      teta_1 = @training_set.sum{|x, y| (x - x_average) * (y - y_average)} / (
               @training_set.sum{|x, y| (x - x_average) ** 2})

      # Calculate teta_0
      teta_0 = y_average - teta_1 * x_average

      # Return the parameters
      [teta_0, teta_1]

    end

    # Calculate the sum of X's or Y's
    def sum(variable)
      @training_set.sum{|x, y| eval(variable)}
    end

    # Calculate the average of X's or Y's
    def average(variable)
      sum(variable).to_f / @training_set.length
    end

  end

end
