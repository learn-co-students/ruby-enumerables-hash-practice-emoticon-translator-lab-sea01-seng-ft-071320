# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)

  file_as_hash = YAML.load_file(file_path)    #load the file automatically as hash, with keys and values in an array form
    hash_of_meaning = {}                      #initialize blank hash. This is will hold the final data in the format we want
    file_as_hash.each do |emotion_name_key,arrays_of_emoticons|        #for every item in the file, do the following
        hash_of_meaning[emotion_name_key] = {}            #create a nested hash for each emotion name, based on the emotion name_key
        hash_of_meaning[emotion_name_key][:english] = arrays_of_emoticons[0]    #for any data in index 0, put it here
        hash_of_meaning[emotion_name_key][:japanese] = arrays_of_emoticons[1]   #for any data in index 1, put it here
    end
  hash_of_meaning    #return a hash with all .yml data in {'emoticon_name' => { :english => "value", :japanese => "value"} } format
end

def get_english_meaning(file_path, japanese_emoticon_to_translate  )
#load the file
#find the Japanese_emoticon_to_translate by comparing it to each value
#return the key (the emotion name) of the emoticon if found and exit
#return error msg otherwise

file_as_hash = load_library(file_path)    #load the file automatically as hash, with keys and values in an array form

file_as_hash.each do |key, nested_key_value|  #for each item in the hash....
          if nested_key_value[:japanese] == japanese_emoticon_to_translate   #compare the value we are searching for with a potential partner in the hash
                 return key   #return the key (the emotion name) if everything matches. Don't execute past this point if true
          end  #end of if
end #file_as_hash do loop

  "Sorry, that emoticon was not found"   #return this msg if no match is found
end  #end def



def get_japanese_emoticon (file_path, english_emoticon_to_translate)
  # code goes here
  file_as_hash = load_library(file_path)    #load the file automatically as hash, with keys and values in an array form

  file_as_hash.each do |key, nested_key_value|  #for each item in the hash....
            if nested_key_value[:english] == english_emoticon_to_translate   #compare the value we are searching for with a potential partner in the hash
                   return nested_key_value[:japanese]   #return the value of the Japanese emoticon if everything matches. Don't execute past this point if true
            end  #end of if
  end #file_as_hash do loop

    "Sorry, that emoticon was not found"   #return this msg if no match is found
end #end def
