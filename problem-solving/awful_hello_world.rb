# Super amazing awesome Genetic Algorithm "Hello World"

# * Chromosome based on: https://rollout.io/blog/using-genetic-algorithms-in-ruby/
class Chromosome
    attr_accessor :size, :value
    SIZE = "hello world".length * 3 * 4 # UTF-8 String --> decimal --> binary
    def initialize(value = '')
        @value = value != '' ? value : Array.new(SIZE) { ["0", "1"].sample }.join('')
    end

    def fitness(expected)
        expected_arr = expected.split('')
        difference = 0
        @value.split('').each_with_index do |curr_i, index|
            difference += (expected_arr[index].to_i - curr_i.to_i)**2
        end
        return difference
    end

    def mutate(probability_of_mutation)
        @value = @value.split('').map { |ch| rand < probability_of_mutation ? invert(ch) : ch }.join('')
    end

    def invert(binary)
        binary == "0" ? "1" : "0"
    end
end

# * string <---> utf-8 binary
def convert_string_to_utf8_binary(str)
    bin = ''
    str.bytes.each do |char_bytes|
        expected_value_dec = "#{char_bytes}".rjust(3, '0') # convert char to lpad utf-8
        # puts "char: #{expected_value_dec}"
        expected_value_dec.split('').each do |digit|
            expected_value_bin = digit.to_i.to_s(2).rjust(4, '0')
            # puts "-- digit #{digit} --> #{expected_value_bin}"
            bin = [bin, expected_value_bin].join('')
        end
    end
    return bin
end

def convert_utf8_binary_to_string(bin)
    str = ''
    bin.scan(/.{12}/).each do |bin_char|
        utf8_code = ''
        bin_char.scan(/.{4}/).each do |bin_digit|
            utf8_code = [utf8_code, bin_digit.to_i(2)].join('')
        end
        begin
            str = [str, utf8_code.to_i.chr].join('')
        rescue
            str = [str, '_'].join('')
        end
    end
    return str
end

def string_bin_size(str)
    return str.length * 3 * 4
end

# * Selection - Crossover
def select(sorted_population)
    # select 2 from top 20%
    sorted_population[0..((sorted_population.length * 0.2).to_i)].sample(2)
end

def crossover(parent1, parent2)
    random_index = rand(parent1.value.length)
    chromosome_value = [parent1.value[0..random_index], parent2.value[random_index+1..-1]].join('')
    child1 = Chromosome.new(chromosome_value)

    random_index = rand(parent1.value.length)
    chromosome_value = [parent1.value[0..random_index], parent2.value[random_index+1..-1]].join('')
    child2 = Chromosome.new(chromosome_value)
    return [child1, child2]
end



# * Init "hello world" --> binary representation
word = "hello world".force_encoding("utf-8")
expected_value = convert_string_to_utf8_binary(word)

# Run
## Init
iterations = 1000
pop_size = 100
mutate_probability = 0.02
## Main Loop
population = []
pop_size.times do |parent|
    parent = Chromosome.new
    # puts "init parent: #{parent.value}"
    population.push(parent)
end
### Evaluate
iterations.times do |iteration|
    new_population = []
    population = population.sort{|a,b| a.fitness(expected_value) <=> b.fitness(expected_value)}
    (pop_size/2).times do |_half_pop_i|
        # SELECT - 2
        parents = select(population) # select 2 from top 20%

        # CROSSOVER
        children = crossover(parents[0], parents[1])

        # MUTATION
        children.each {|child| child.mutate(mutate_probability)}
        new_population << children[0]
        new_population << children[1]
    end
    new_population << population[0] # always incorporate best one
    puts convert_utf8_binary_to_string(population[0].value)
    population     = new_population
    new_population = []
    ### Evaluate
    break if population[0].value == expected_value
end


