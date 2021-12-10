module Ellipses where

import Codec.Picture

import ShapeGraphics

simpleEllipsePic :: Float -> Picture
simpleEllipsePic n = map greenEllipse [0, pi/n..(n-1)*pi/n]
 where
    greenEllipse :: Float -> PictureObject
    greenEllipse angle = Ellipse (Point 400 400) 250 70 angle myGreen Solid SolidFill
    myGreen = Colour 25 230 32 80

writeToFile :: Picture -> IO ()
writeToFile pic
    = writePng "output.png"
        (drawPicture 3 pic)