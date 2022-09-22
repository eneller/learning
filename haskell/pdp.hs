listInt = [1,2,3]
listChar = "HalloDiesIstEinTestABC"
listList = [[1,2,3],[4,5,6],[7,8,9]]

double = map (\x -> 2*x)

evenDouble = map (\x -> if x `mod` 2 == 0 then x*2 else x)

sum' :: Num a => [a] -> a
sum' xs= foldl (+) 0 xs

concat' :: [[a]] -> [a]
concat' = foldl (++) []

quadratsumme :: (Num a, Enum a) => a -> a
quadratsumme n = foldl (+) 0 [x*x|x <- [1..n]]

reverse' :: [a] -> [a]
reverse' = foldl (\acc x ->  x: acc ) []

reverse'' :: [a] -> [a]
reverse'' = foldr (\x ini -> ini ++ [x] )  [] 

minmax :: (Ord a)=> [a]-> (a,a)
minmax (x:xs) = foldl (\ (a,b) x -> (min a x, max b x)) (x,x) xs

zip' :: [a] -> [b] -> [(a,b)]
zip' _  [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = [(x,y)] ++ zip' xs ys 

unzip' :: [(a,b)] -> ([a], [b])
unzip' [] = ([],[])
unzip' (x:xs) = ((fst x) : a,( snd x) : b) where (a,b) = unzip' xs

isSet :: Eq a => [a] -> Bool
isSet [] = True
isSet (_:[]) = True
isSet list@(x:xs) =if (elem x xs) then False else isSet xs

-- applies a function f c times to an input a
multiple :: (Ord c, Num c) => c -> (a -> a) -> a -> a
multiple 0 _ a = a
multiple c f a = if (c < 0) then error "negative" else multiple (c-1) f (f a)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x
safeHead' :: [a] -> Either String a
safeHead' [] = Left "eeeemptyyy"
safeHead' (x:xs) = Right x

-- algebraic data types
data Alter = Kind | Jugendlich | Erwachsen | Alt | Tot deriving (Enum, Eq, Show)
data LFarbe = Rot | Gruen | Blau | Gelb deriving (Enum, Eq, Show)
data Mensch = Name String Alter LFarbe 
-- equiv to type Name = String
data Stammbaum = Knoten Mensch Mensch [Stammbaum] | Blatt Mensch
names :: Stammbaum -> [String]
names (Knoten (Name n1 _ _) (Name n2 _ _) ls ) =  n1 : n2 : concat (map names ls ) 
names (Blatt (Name n a _)) = if (a /= Tot) then [n] else []


familie = Knoten (Name "Alice" Erwachsen Rot) (Name "Bob" Erwachsen Gruen) 
          [     
                Knoten (Name "Dave" Erwachsen Gruen) (Name "Eve" Erwachsen Blau) 
                [
                        Blatt (Name "Franz" Jugendlich Blau),
                        Blatt (Name "Gabriella" Kind Gelb)
                ],
                Knoten (Name "Hanna" Erwachsen Gelb) (Name "Igor" Erwachsen Blau) [],
                Blatt (Name "Jana" Tot Rot)
          ]



-- Trees
data Tree a = Empty | Node (Tree a) a (Tree a)
exampleTree = Node (Node Empty 4 Empty) 3 (Node  Empty 5 Empty)
numElems :: Tree a -> Int
numElems (Empty) = 0
numElems (Node t1 _ t2) = 1 + numElems t1 + numElems t2

sumTree :: (Num a)=> Tree a-> a
sumTree (Empty) = 0
sumTree (Node r a l) = a + sumTree r + sumTree l

foldTree :: Tree a => (a-> 
foldTree fe fn Empty = fe
foldTree
