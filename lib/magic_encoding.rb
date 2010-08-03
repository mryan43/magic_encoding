# -*- encoding : utf-8 -*-~

# A simple library to prepend the encoding magic comment introduced with ruby 1.9 to 
# multiple ".rb" files

class AddMagicComment
  
  # TODO : check that the encoding specified is a valid encoding
  def self.process(encoding = "utf-8", directory = Dir.pwd)
    
    # TODO : add support for other formats of magic comment (coding instead of encoding, emacs style magic comment, etc..)
    prefix = "# -*- encoding : #{encoding} -*-~\n"
    
    # TODO : add options for recursivity (and application of the script to a single file)
    rbfiles = File.join(directory ,"**", "*.rb")
    Dir.glob(rbfiles).each do |filename|
      file = File.new(filename, "r+")
      
      file_data = file.read
      prefix_match = file_data[0..prefix.length-1]

      # go back to top
      file.pos = 0
      
      # TODO : detect when to replace current encoding
      if prefix_match and prefix_match != prefix
        file.puts(prefix+file_data) 
      end
      file.close
    end
    p "Encoding magic comment set for #{Dir.glob(rbfiles).count} source files"
  end
end
