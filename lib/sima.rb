require "sima/version"
require 'YAML'
require 'json'
require 'msgpack'

module Sima
  def self.dump(obj, file_path, format = nil)
    if format.nil?
      format = guessformat(file_path)
    end
    File.open(File.expand_path(file_path), 'wb') do |f|
      case format
      when 'mar', 'marshal'
        f.write(Marshal.dump(obj))
      when 'yaml', 'yml'
        f.write(YAML.dump(obj))
      when 'json'
        f.write(JSON.dump(obj))
      when 'mpac', 'msg', 'msgpac'
        f.write(MessagePack.pack(obj))
      else
        raise ArgumentError, "Unknown serialization format."
      end
    end
  end
  def self.load(file_path, format = nil)
    if format.nil?
      format = guessformat(file_path)
    end
    f = File.read(File.expand_path(file_path))
    case format
    when "mar", "marshal"
      obj = Marshal.load(f)
    when "yaml", "yml"
      obj = YAML.load(f)
    when 'json'
      obj = JSON.load(f)
    when 'mpac', 'msg', 'msgpac'
      obj = MessagePack.unpack(f)
    else
      raise ArgumentError, "Unknown serialization format"
    end
    return obj
  end
  def self.guessformat(file_path)
    return file_path.downcase.split(/\./).last
  end
  private_class_method :guessformat
end
