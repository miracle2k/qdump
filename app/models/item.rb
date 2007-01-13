class Item < ActiveRecord::Base
  validates_presence_of :date_added, :datatype, :data
  
  # we use number as well as most ansi chars in the accessor ids we give out. 
  # case doesn't matter and we default to lowercase, but note that "l" and "i" are 
  # missing anyway, to avoid any possible confusion with the uppercase "I", which 
  # happens quite often, depending on the used font.
  # note that once the system is running and you have already collected data by users,
  # DO NOT CHANGE THIS ALPHABET! The accessors are not hard-assigned, but are just 
  # converted to an id upon request: You will invalidate most of the URLs you've been
  # giving out.
  @accessorChars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  
  def self.latest_items
    find(:all,
         :order => "date_added desc")
  end
  
  def self.id2accessor(id)
    id = id - 1
    result = ""
    if (id >= 0)
      result = @accessorChars[id % (@accessorChars.length)]
      divRes = (id / @accessorChars.length).floor
      if (divRes)     
        result = id2accessor(divRes) + result
      end
    end
    return result
  end
  
  def self.accessor2id(accessor)
    result = 0
    (accessor.length).downto(1) do |i|
      char = accessor[i-1,1]
      charIdx = @accessorChars.index(char)+1
      if (charIdx != nil) 
        result = result + charIdx * (@accessorChars.length**(accessor.length-i)).to_i; 
      else 
        # invalid character in input, forget it, return 0
        return 0;
      end
    end
    return result
  end
end
