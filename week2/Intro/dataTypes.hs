-- Defining own data types

-- Not best way of doing because point and vector are interchangeable
type Point = (Float, Float)
type Vector = (Float, Float)
type Line = (Float, Float)
type Colour = (Int, Int, Int, Int) -- RGBD

movePoint :: Point -> Vector -> Point
movePoint (x, y) (dx, dy) = (x + dx, y + dy)

-- Correct Way
data Point' = Point' Float Float
            deriving (Show, Eq)

data Vector' = Vector' Float Float  
            deriving (Show, Eq)

movePoint' :: Point' -> Vector' -> Point'
movePoint' (Point' x y) (Vector' dx dy)
    = Point' (x + dx) (y + dy)

-- Similarly
data Colour' = Colour' Int Int Int Int

-- Record
data Color'' = Color'' {
    redC :: Int,
    greenC :: Int,
    blueC :: Int,
    opacityC :: Int
} deriving (Show, Eq)

x = Color'' 255 100 200 255

-- Enumeration Types
data LineStyle  = Solid
                | Dashed
                | Dotted
                deriving (Show, Eq)

data FillStyle  = SolidFill | NoFill
                deriving (Show, Eq)

-- Example
solidLine :: LineStyle
solidLine = Solid

noFill :: FillStyle
noFill = NoFill

-- Algebraic Data Type

data PictureObject 
    = Path [Point']        Colour LineStyle
    | Circle Point'  Float Colour LineStyle FillStyle
    | Polygon [Point']     Colour LineStyle FillStyle
    | Ellipse Point' Float Float Float
                            Colour LineStyle FillStyle
    deriving (Show, Eq)

type Picture = [PictureObject]