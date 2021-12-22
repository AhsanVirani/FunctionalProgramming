longName :: String -> String 
longName name = case name of 
                    "Alex"  -> "Alexander"
                    "Jenny" -> "Jenny"
                    _       -> "Unknown" -- Default
            
data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = case planet of
                        Mercury -> seconds/(60*60*24*365.25*0.2408467)
                        Venus   -> seconds/(60*60*24*365.25*0.61519726)
                        Earth   -> seconds/(60*60*24*365.25)
                        Mars    -> seconds/(60*60*24*365.25*1.8808158)
                        Jupiter -> seconds/(60*60*24*365.25*11.862615)
                        Saturn  -> seconds/(60*60*24*365.25*29.447498)
                        Uranus  -> seconds/(60*60*24*365.25*84.016846)
                        Neptune -> seconds/(60*60*24*365.25*164.79132)