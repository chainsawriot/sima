require "sima/version"
require "YAML"

module Sima
  def self.dump(obj, file_path, format = nil)
    if format.nil?
      format = guessformat(file_path)
    end
    case format
    when "mar", "marshal"
      File.open(File.expand_path(file_path), 'wb') { |f| f.write(Marshal.dump(obj)) }
    when "yaml", "yml"
      File.open(File.expand_path(file_path), 'wb') { |f| f.write(YAML.dump(obj)) }
    else
      raise ArgumentError, "Unknown serialization format."
    end
  end
  def self.load(file_path, format = nil)
    if format.nil?
      format = guessformat(file_path)
    end
    case format
    when "mar", "marhsal"
      obj = Marshal.load(File.read(File.expand_path(file_path)))      
    when "yaml", "yml"
      obj = YAML.load(File.read(File.expand_path(file_path)))
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
