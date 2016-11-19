require "sima/version"
require 'YAML'
require 'json'
require 'msgpack'

module Sima
  def self.dump(obj, format = 'mar')
    case format
    when 'mar', 'marshal'
      Marshal.dump(obj)
    when 'yaml', 'yml'
      YAML.dump(obj)
    when 'json'
      JSON.dump(obj)
    when 'mpac', 'msg', 'msgpac'
      MessagePack.pack(obj)
    else
      raise ArgumentError, "Unknown serialization format."
    end
  end
  def self.load(source, format = 'mar')
    case format
    when "mar", "marshal"
      Marshal.load(source)
    when "yaml", "yml"
      YAML.load(source)
    when 'json'
      JSON.load(source)
    when 'mpac', 'msg', 'msgpac'
      MessagePack.unpack(source)
    else
      raise ArgumentError, "Unknown serialization format."
    end
  end
  def self.export(obj, file_path, format = nil)
    if format.nil?
      format = guessformat(file_path)
    end
    File.open(File.expand_path(file_path), 'wb') do |f|
      f.write(dump(obj, format))
    end
  end
  def self.import(file_path, format = nil)
    if format.nil?
      format = guessformat(file_path)
    end
    f = File.read(File.expand_path(file_path))
    obj = load(f, format)
    return obj
  end
  def self.guessformat(file_path)
    return file_path.downcase.split(/\./).last
  end
  private_class_method :guessformat
end
