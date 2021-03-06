require_relative './config.rb'

class Machine
  attr_reader :name, :type, :hostname, :ip, :memory, :box, :url

  LINUX   = 1
  WINDOWS = 2

  def initialize(
    name:,
    type:,
    hostname:,
    ip:,
    memory: nil,
    box: nil,
    url: nil,
    config: nil
  )
    @name = name
    @type = type
    @ip = ip
    @hostname = hostname
    @memory = memory
    @box = box
    @url = url

    if not config.nil?
      @memory = if memory.nil? then config.getMemory(name) end
      @box = if box.nil? then config.getBox(type, name) end
      @url = if url.nil? then config.getBoxURL(name) end
    end
  end
end
