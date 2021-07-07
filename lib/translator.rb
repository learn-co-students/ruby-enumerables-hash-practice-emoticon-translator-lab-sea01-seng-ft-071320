# require modules here
require "yaml"
require 'pry'

def load_library (file)
  # code goes here
  emoticons_yml = YAML.load_file('lib/emoticons.yml')
  hash = {}
    emoticons_yml.each do |key, value| 

    hash[key] = {}
    hash[key][:english]= value[0] 
	  hash[key][:japanese]= value[1]
              end
    hash
    #binding.pry 
end


def get_japanese_emoticon (file,eng_emo)
  # code goes here
 emoticons_jap = load_library(file)
  jap_meaning =""
  emoticons_jap.each do |meaning, lang|
      if lang[:english] == eng_emo
      jap_meaning = lang[:japanese] 
      return jap_meaning
      end
   end
      if jap_meaning = ""
       return "Sorry, that emoticon was not found"
   end
end
   

 def get_english_meaning(file,value)
    # code goes here
  emoticons = load_library(file)
    eng_meaning = ""
    
  emoticons.each do |meaning, lang|
    lang.each do |inner_key,emoticon|
      if emoticon == value
        eng_meaning = meaning
      end
    end
    if eng_meaning == ""
      eng_meaning = "Sorry, that emoticon was not found"
    end  
  end
  eng_meaning
end
