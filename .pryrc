 # === EDITOR ===
Pry.editor = 'nvim'
require 'amazing_print'

# == Pry-Nav - Using pry as a debugger ==
Pry.commands.alias_command('c', 'continue') if Pry::Commands["continue"]
Pry.commands.alias_command('s', 'step') if Pry::Commands["step"]
Pry.commands.alias_command('n', 'next') if Pry::Commands["next"]
Pry.commands.alias_command 'e', 'exit'

# === CUSTOM PROMPT ===
# This prompt shows the ruby version (useful for RVM)
# Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]
BLACK = "\001\e[0;30m\002"
WHITE = "\001\e[0m\002"
Pry.prompt = [
    proc { |target_self, nest_level, pry|
      line_num = pry.input_array.size
      prompt = "#{line_num} "
      "#{BLACK}#{prompt}#{WHITE}"
    },
    proc { |target_self, nest_level, pry|
      prompt = ". "
      "#{BLACK}#{prompt}#{WHITE}"
    }
  ]

# === Listing config ===
# Better colors - by default the headings for methods are too 
# similar to method name colors leading to a "soup"
# These colors are optimized for use with Solarized scheme 
# for your terminal
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

begin
  require 'amazing_print'
  # The following line enables awesome_print for all pry output,
  # and it also enables paging
  Pry.config.print = proc { |output, value|
    formatted = value.ai
    value.ai.split("\n").each_with_index do |v, i|
      prefix = (i == 0) ? "=>" : '. '
      output.puts "#{BLACK}#{prefix}#{WHITE} #{v}"
    end
    # output.puts formatted
    # Pry::Helpers::BaseHelpers.stagger_output("#{BLACK}=>#{WHITE} #{value.ai}", output)
  }
  AmazingPrint.defaults = {
    :string_limit => 80,
    :indent => 2,
    :multiline => true,
    :sort_keys => true
  }
  AwesomePrint.pry!
  # If you want awesome_print without automatic pagination, use the line below
  # Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "gem install awesome_print  # <-- highly recommended"
end
Pry::Commands.command /^clear$/, "clear console" do
  system('clear')
end

Pry::Commands.command /^clear!$/, "clear console including tmux scrollback buffer" do
  system('clear!')
end
