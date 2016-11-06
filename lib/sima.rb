require "sima/version"

module Sima
  def self.dump(obj, file_path)
    File.open(File.expand_path(file_path), 'wb') { |f| f.write(Marshal.dump(obj)) }
  end
  def self.load(file_path)
    obj = Marshal.load(File.read(File.expand_path(file_path)))
    return obj
  end
end
