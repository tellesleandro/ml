module GenericRegression

  class CostFunction

    def initialize(symbolic_function)

      @symbolic_function = symbolic_function

    end

    def mse(dataset)

      # initialize MSE
      mse = 0

      dataset.each do |row|
        mse += (@symbolic_function.subs(row) - row[:Y]) ** 2
      end

      mse /= dataset.length

      parameters = mse.variables

      derivatives = {}
      parameters.each do |parameter|
        derivatives[parameter] = mse.diff(parameter)
      end

      derivatives

    end

    def minimize(derivatives, parameters_initial_values, learning_rate)

      parameters = parameters_initial_values

      x = 0

      while x < 1000

        temp_values = {}

        derivatives.each do |parameter, mse|
          temp_values[parameter] = mse.subs(parameters)
        end

        parameters.each do |parameter, value|
          parameters[parameter] -= learning_rate * temp_values[parameter]
        end

        x += 1

      end

      @symbolic_function.subs(parameters)

    end

  end

end
