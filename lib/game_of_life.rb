def initialise
  grid = []
  row = []

  (1..10).each do |x|
    (1..10).each do |y|
      row << Object
    end
    grid << row
    row = []
  end
  return grid
end