module LinearRegression

  class GradientDescent

    attr_reader :parameters_iteration_count

    def initialize(training_set)
      @training_set = training_set
    end

    # Calculate the parameters (teta_0 and teta_1) that fits better the
    # training set.
    def parameters(initial_teta_0, initial_teta_1, learning_rate,
                        delta_stop)

      # Assign training set length
      m = @training_set.length

      # Assign current_teta's and cast to float
      current_teta_0, current_teta_1 = initial_teta_0.to_f, initial_teta_1.to_f

      # initialize iteration counter
      @parameters_iteration_count = 0

      # Interate over teta's until the derivative is lower than a given delta
      while true

        # Calculate teta_0 and teta_1 derivatives based on gradient descent
        # algorithm (simultaneous update)
        teta_0_derivative = @training_set.sum{|x, y| current_teta_0 +
                            current_teta_1 * x - y} / m
        teta_1_derivative = @training_set.sum{|x, y| (current_teta_0 +
                            current_teta_1 * x - y) * x} / m

        # Update parameters variable
        current_teta_0 -= learning_rate * teta_0_derivative
        current_teta_1 -= learning_rate * teta_1_derivative

        # Increment iteration counter
        @parameters_iteration_count += 1

        # Stop if derivative is lower than a given delta
        break if teta_0_derivative.abs < delta_stop &&
                  teta_1_derivative.abs < delta_stop
      end

      # return parameters
      [current_teta_0, current_teta_1]

    end

  end

end
