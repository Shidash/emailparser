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
          toclean(line)
        end

        if line.include?("From") && from !=1
          from = 1
          fromclean(line)
        end

        if line.include?("Date") && date != 1
          date = 1
          dateclean(line)
        end

        if line.include?("MessageId") && messageid !=1
          messageid = 1
          messageidclean(line)
        end

        if line.include?("Cc") && cc !=1
          cc = 1
          ccclean(line)
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

  def self.toclean(to)
    puts to
  end

  def self.fromclean(from)
    puts from
  end

  def self.dateclean(date)
    puts date
  end

  def self.messageidclean(messageid)
    puts messageid
  end

  def self.ccclean(cc)
    puts cc
  end

  process(getfile)
end
