# -*- coding: utf-8 -*-
module ValidationFormats
  
  def self.test_values( descriptor )

    case descriptor
      
    when /^title text$/
      [
        [ "A Good Title", "AN ACCEPTABLE TITLE", "another classic title", "Another 1" ],
        [ "a bad titl%", "a (*)", "A ;; No", "(Bad)", "I do not like, commas", "I do not like - dashes" ]
      ]
      
    when /^article text$/
      [
        [ "I am a happy article on the merits\n of being a dead good sculpticulator.",
          "I am a delighted article on the importance of chisels, the sculptor's often forgotten best friend.",
          "I am a lovely article on the death of middens in mid-mediaeval cock 9 hate bastard shitpony (parenthesised) dicks!",
          "Who am I?"
        ],
        [ "I have stupid input ^&* boo;."
        ]
      ]
      
    when /^whole number$/
      [
        [ 1, 2, 3, 0 -1, 123, -123, "42" ],
        [ "1.1", "one", "first" ]
      ]
      
    else
      raise( "Unrecognised ValidationFormats descriptor #{ descriptor.inspect }." )
    end
    
  end
  
end
