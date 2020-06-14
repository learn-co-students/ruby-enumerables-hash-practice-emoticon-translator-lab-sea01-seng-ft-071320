require 'yaml'

def load_library(list)
  library = YAML.load_file(list)
  library.each do |key, value|
      library[key] = {:english => value[0], :japanese => value[1]}
  end
return library

end

def get_japanese_emoticon(list, emotion)
  library = load_library(list)
  library.each do |outer_key, outer_value|
    if outer_value[:english] == emotion
      return outer_value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(list, emotion)
  library = load_library(list)
  library.each do |outer_key, outer_value|

    if outer_value[:japanese] == emotion
      return outer_key
    end
  end
  return "Sorry, that emoticon was not found"
end
