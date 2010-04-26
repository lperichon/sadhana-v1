module Paperclip
  class Tempfile < ::Tempfile
    # Fix for ruby 1.9.2
    def make_tmpname(basename, n)
      extension = File.extname(basename)
      sprintf("%s,%d,%s%s", File.basename(basename, extension), $$, n, extension)
    end
  end
end