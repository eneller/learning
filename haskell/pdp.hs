listInt = [1,2,3]
listChar = "HalloDiesIstEinTestABC"
listList = [[1,2,3],[4,5,6],[7,8,9]]

double = map (\x -> 2*x)

evenDouble = map (\x -> if x `mod` 2 == 0 then x*2 else x)

sum' :: Num a => [a] -> a
sum' xs= foldl (+) 0 xs

concat' :: [[a]] -> [a]
concat' = foldl (++) []

fliptuples :: [(a,b)] -> [(b,a)]
fliptuples = map (\ (a,b) -> (b,a))

rotate :: (Num b, Eq b) => b -> [a] -> [a]
rotate 0 ls = ls
rotate _ [] = []
rotate r (x:xs) = rotate (r-1) (xs++[x])

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
data Mensch = Mensch String Alter LFarbe deriving (Show)
-- first Mensch is type name, second is constructor name
data Stammbaum = Knoten Mensch Mensch [Stammbaum] | Blatt Mensch
names :: Stammbaum -> [String]
names (Knoten (Mensch n1 _ _) (Mensch n2 _ _) ls ) =  n1 : n2 : concat (map names ls ) 
names (Blatt (Mensch n a _)) = if (a /= Tot) then [n] else []

getMensch :: Stammbaum -> [Mensch]
getMensch (Blatt m) = [m]
getMensch (Knoten m1 m2 ls) = m1:m2:concat(map getMensch ls)

familie = Knoten (Mensch "Alice" Erwachsen Rot) (Mensch "Bob" Erwachsen Gruen) 
          [     
                Knoten (Mensch "Dave" Erwachsen Gruen) (Mensch "Eve" Erwachsen Blau) 
                [
                        Blatt (Mensch "Franz" Jugendlich Blau),
                        Blatt (Mensch "Gabriella" Kind Gelb)
                ],
                Knoten (Mensch "Hanna" Erwachsen Gelb) (Mensch "Igor" Erwachsen Blau) [],
                Blatt (Mensch "Jana" Tot Rot)
          ]



-- Trees
data Tree a = Empty | Node (Tree a) a (Tree a)
exampleTree = Node (Node Empty 4 Empty) 3 (Node  Empty 5 Empty)
numElems :: Tree a -> Int
numElems (Empty) = 0
numElems (Node t1 _ t2) = 1 + numElems t1 + numElems t2

foldTree :: (c) -> (c -> a -> c -> c) -> Tree a -> c 
foldTree fe fn tree = m tree where m Empty = fe; m (Node r e l) = fn (m r) e (m l)

sumTree :: (Num a)=> Tree a-> a
sumTree (Empty) = 0
sumTree (Node r a l) = a + sumTree r + sumTree l

sumTree' :: (Num a)=> Tree a -> a
sumTree' = foldTree (0) (\ right current left -> right + current +left)


type Laenge = Int
type MaxDurchfluss = Float
type Adresse = String
data Kanal = Anschluss Adresse MaxDurchfluss| Kanalstueck Laenge MaxDurchfluss [Kanal] deriving (Eq, Show)

kanal =  Kanalstueck 200 2.5 [
                (Kanalstueck 100 1.4 [
                    (Anschluss "Karlstr. 14" 0.4),
                    (Anschluss "Karlstr. 16" 0.4),
                    (Anschluss "Karlstr. 18" 0.4)
                ]),
                (Kanalstueck 80 1.1 [
                    (Anschluss "Karlstr./Keplerstr." 0.1),
                    (Anschluss "Keplerstr. 34" 0.5),
                    (Kanalstueck 100 0.5 [
                        (Anschluss "Olgastr." 0.2),
                        (Anschluss "Gymnasium" 0.3) ])
                ])
            ]

foldKanal :: (Adresse -> MaxDurchfluss -> r) -> (Laenge -> MaxDurchfluss -> [r] -> r) -> Kanal-> r
foldKanal fa fk kanal = m kanal where m (Anschluss adr durchf) = fa adr durchf
                                      m (Kanalstueck len durchf ls) = fk len durchf (map m ls)

kanallaenge :: Kanal -> Laenge
kanallaenge ( Anschluss _ _)= 0
kanallaenge (Kanalstueck len _ ls) = len + sum(map kanallaenge ls)
kanallaenge' :: Kanal -> Laenge
kanallaenge' = foldKanal (\_ _ ->0) (\ len _ ls -> len + (sum ls))
