require 'rubygems'
require 'json'

class Parse
  def self.getfile
    file = gets.chomp
  end

  def self.process(file)
    File.open(file, "r") do |fileprocess|
      to = from = date = messageid = cc = bcc = inreplyto = i = subject = 0
      fileprocess.each_line do |line|
        i = i+1

        if i == 1
          puts line
        end
        if line.include?("To") && to != 1
          to = 1
          Clean.toclean(line)
        end

        if line.include?("From") && from !=1
          from = 1
          puts line
        end

        if line.include?("Date") && date != 1
          date = 1
          puts line
        end

        if line.include?("MessageId") && messageid !=1
          messageid = 1
          puts line
        end

        if line.include?("Cc") && cc !=1
          cc = 1
          puts line
        end

        if line.include?("Bcc") && bcc !=1
          messageid = 1
          puts line
        end

        if line.include?("InReplyTo") && inreplyto !=1
          inreplyto = 1
          puts line
        end
      end
    end
  end

  process(getfile)
end

class Clean
  def self.toclean(to)
    puts to
  end
end
