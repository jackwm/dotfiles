require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

##############################################
class String
  def format_nicely
    string = gsub /^ {4}/, ''
    string.gsub! /(?!\\)"/, '\"'
    nice = `echo "#{string}" | fmt -s --width=#{ENV["COLUMNS"].to_i - 2}`
    nice.gsub /^/, ' '
  end
end

Object.class_eval do
  def ivars
    instance_variables.inject({}) do |a,v|
      key = v.to_s.reverse.chop.reverse.to_sym
      a[key] = instance_variable_get(v)
      a
    end
  end

  def look
    puts <<-LOOK.format_nicely
    [ class ] #{self.class}

    [ methods ]
    #{(methods - Object.new.methods).sort.join ', '}

    [ ivars ]
    #{instance_variables.sort.join ', '}

    LOOK
  end
end

Module.class_eval do
  def look
    puts <<-LOOK.format_nicely
    [ class ] #{self.class}

    [ ancestors ]
    #{ancestors.join ' < '}

    [ modules ]
    #{included_modules.join ', '}

    [ class methods ]
    #{(methods - Class.new.methods).sort.join ', '}

    [ instance methods ]
    #{instance_methods(false).sort.join ', '}

    [ class variables ]
    #{class_variables.sort.join ', '}

    [ ivars ]
    #{instance_variables.sort.join ', '}

    [ constants ]
    #{constants.sort.join ', '}
    LOOK
  end
end
#####################################################

# Evaluate the code on the clipboard.
def ep
  IRB.CurrentContext.workspace.evaluate(self, paste)
end

# http://gist.github.com/124272
# Thanks to Bjørn Arild Mæland
def copy(str)
  IO.popen('xclip -i', 'w') { |f| f << str.to_s }
end

def paste
  `xclip -o`
end
