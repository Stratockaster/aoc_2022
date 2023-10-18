module AOC
  def self.input
    File.readlines('input/day7', chomp: true).map { |el| el.split(' ') }
  end

  def self.build_tree
    tree = ElvenDirectory.new(name: 'root', parent: nil)
    current_dir = tree
    input[1..].each do |el|
      case el
      in ['$', 'cd', dirname]
        if dirname == '..'
          current_dir = current_dir.parent
        else
          next_dir = current_dir.subdirs.find { |dir| dir.name == dirname }
          if next_dir.nil?
            next_dir = ElvenDirectory.new(name: dirname, parent: current_dir)
            current_dir.subdirs << next_dir
          end
          current_dir = next_dir
        end
      in ['dir', dirname]
        subdir = ElvenDirectory.new(name: dirname, parent: current_dir)
        current_dir.subdirs << subdir
      in [size, name]
        file = ElvenFile.new(name:, size:)

        current_dir.files << file
      end
    end

    tree
  end
end

class ElvenDirectory
  attr_reader :name, :files, :parent
  attr_accessor :subdirs

  def initialize(name:, parent: nil, subdirs: [], files: [])
    @name = name
    @subdirs = subdirs
    @files = files
    @parent = parent
  end

  def size
    @size || @subdirs.map(&:size).sum + @files.map(&:size).sum
  end

  def dir_sizes
    [size] + @subdirs.flat_map(&:dir_sizes)
  end
end

class ElvenFile
  attr_reader :name, :size

  def initialize(name:, size:)
    @name = name
    @size = size.to_i
  end
end

tree = AOC.build_tree

pp tree.dir_sizes.select { |s| s <= 100_000 }.sum
pp tree.dir_sizes.reject { |i| i < tree.size - 40_000_000 }.min
