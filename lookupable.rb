
module Lookupable
    def lookup(lookupindex,lookupvalue,returnindex)
        isarray = self.class == Array 
        self.each_with_index {|element,index| 
            record = isarray ? element : element.last      
            if record[lookupindex]==lookupvalue then 
                return record[returnindex] 
            end                    
        }
        return nil
    end
end
class Array
    include Lookupable
end
class Hash
    include Lookupable
end

a = [ ["Mercury", "Hg", 80, 200.592 ],
      ["Argon",   "Ar", 18,  39.948 ],
      ["Chromium","Cr", 24,  51.9961] ] 

a.lookup(1,"Ar",3)  # returns atomic weight of Argon

h = {  "Hg" => { name: "Mercury",  atomicno: 80, weight: 200.592 },
       "Ar" => { name: "Argon",    atomicno: 18, weight:  39.948 },
       "Cr" => { name: "Chromium", atomicno: 24, weight:  51.9961}  }
