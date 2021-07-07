require 'pry'
require "yaml"

def load_library(file_path)
    data = YAML.load_file(file_path)
    result = data.each_with_object({}) do |(key,value), final_hash|
      final_hash[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    end 
    result
end


def get_english_meaning(file_path, emoticon)
  data = load_library(file_path)
  english_meaning = ""
  data.each_with_object({}) do |(key,value)|
    if emoticon == value[:japanese] 
      english_meaning = key
    end
  end 
  if english_meaning == ""
    english_meaning = "Sorry, that emoticon was not found"
  end
  english_meaning
end

def get_japanese_emoticon(file_path, emoticon)
  data = load_library(file_path)
  japanese_meaning = ""
  data.each_with_object({}) do |(key, value)|
    if emoticon == value[:english]
      japanese_meaning = value[:japanese]
    end
  end
  if japanese_meaning == ""
    japanese_meaning = "Sorry, that emoticon was not found"
  end
  japanese_meaning
end

