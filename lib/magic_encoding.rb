# -*- encoding : utf-8 -*-

# A simple library to prepend magic comments for encoding to multiple ".rb" files

module AddMagicComment
  
  # Options :
  # 1 : Encoding
  # 2 : Path
  # TODO : check that the encoding specified is a valid encoding
  def self.process(options)
    
    # defaults
    encoding  = options[0] || "utf-8"
    directory = options[1] || Dir.pwd
    
    prefix = "# -*- encoding : #{encoding} -*-\n"
    
    # TODO : add options for recursivity (and application of the script to a single file)
    rbfiles = File.join(directory ,"**", "*.rb")
    Dir.glob(rbfiles).each do |filename|
      file = File.new(filename, "r+")
      
      lines = file.readlines
      
      # remove current encoding comment(s)
      while lines[0] && (
            lines[0].starts_with?("# encoding") || 
            lines[0].starts_with?("# coding") ||
            lines[0].starts_with?("# -*- encoding"))
        lines.shift
      end

      # set current encoding
      lines.insert(0,prefix)
      
      file.pos = 0
      file.puts(lines.join) 
      file.close
    end
    p "Magic comments set for #{Dir.glob(rbfiles).count} source files"
  end
  
end

class String

  def starts_with?(s)
    self[0..s.length-1] == s
  end

end




