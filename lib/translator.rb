require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons_hash = {}
  emoticons_hash["get_emoticon"] = {}
  emoticons_hash["get_meaning"] = {}
    

  emoticons.each do |meaning, emoticon_arr|
    emoticons_hash["get_emoticon"][emoticon_arr.first] = emoticon_arr.last
    emoticons_hash["get_meaning"][emoticon_arr.last] = meaning
  end
  emoticons_hash  
end



  
def get_japanese_emoticon(file_path, emoticon)
  emoticons_hash = load_library(file_path)
  japanese_equivalent = emoticons_hash["get_emoticon"][emoticon]
  if japanese_equivalent
    return japanese_equivalent
  else
    return "Sorry, that emoticon was not found"
  end  
end



def get_english_meaning(file_path, emoticon)
  emoticons_hash = load_library(file_path)
  meaning = emoticons_hash["get_meaning"][emoticon]
  if meaning
    return meaning
  else
    return "Sorry, that emoticon was not found"
  end  
end