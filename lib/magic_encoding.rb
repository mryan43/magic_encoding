# -*- encoding : utf-8 -*-

# A simple library to prepend magic comments for encoding to multiple ".rb" files

module AddMagicComment

  # Options :
  # 1 : Encoding
  # 2 : Path
  # TODO : check that the encoding specified is a valid encoding
	# TODO : allow use of only one option, so the encoding would be guessed (maybe using `file --mime`?)
  def self.process(options)

    # defaults
    encoding  = options[0] || "utf-8"
    directory = options[1] || Dir.pwd

    prefix = "-*- encoding : #{encoding} -*-\n"

    # TODO : add options for recursivity (and application of the script to a single file)

		extensions = {
			'rb' => '# {text}',
			'haml' => '-# {text}',
		}

		count = 0
		extensions.each do |ext, comment_style|
			rbfiles = File.join(directory ,'**', '*.'+ext)
			Dir.glob(rbfiles).each do |filename|
				file = File.new(filename, "r+")

				lines = file.readlines

				# remove current encoding comment(s)
				while lines[0] && (
							lines[0].starts_with?(comment_style.sub('{text}', 'encoding')) ||
							lines[0].starts_with?(comment_style.sub('{text}', 'coding')) ||
							lines[0].starts_with?(comment_style.sub('{text}', '-*- encoding')))
					lines.shift
				end

				# set current encoding
				lines.insert(0,comment_style.sub('{text}', prefix))
				count += 1

				file.pos = 0
				file.puts(lines.join)
				file.close
			end
		end

    puts "Magic comments set for #{count} source files"
  end

end

class String

  def starts_with?(s)
    self[0..s.length-1] == s
  end

end




