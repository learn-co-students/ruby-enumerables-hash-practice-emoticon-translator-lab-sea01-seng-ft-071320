# require modules here
require 'yaml'
require 'pry'

def load_library file
  data = YAML.load_file(file)
  
  emoticons = {}
  data.each do | k, v |
    if emoticons[k] == nil
      emoticons[k] = {}
    end
    
    emoticons[k][:english] = v[0]
    emoticons[k][:japanese] = v[1]
  end
  
  emoticons
end

def get_japanese_emoticon file, emoticon
  emoticons = load_library file
  
  emoticons.each do | emo, data |
    data.each do | lang, icon |
      if icon == emoticon
        return emoticons[emo][:japanese]
      end
    end
  end
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning file, emoticon
  emoticons = load_library file
  
  emoticons.each do | emo, data |
    data.each do | lang, icon |
      if icon == emoticon
        return emo
      end
    end
  end
  
  return "Sorry, that emoticon was not found"
end