import Data.Functor.Contravariant (Contravariant (contramap))

maybeToList :: Maybe a -> [a]
maybeToList (Just x) = [x]
maybeToList Nothing = []

-- fmap f. alpha = alpha . fmap f
-- Maybe a -> [a] -> [b] = Maybe a -> Maybe b -> [b] (Naturality condition ./)

newtype Reader e a = Reader (e -> a)

instance Functor (Reader e) where
  fmap f (Reader g) = Reader (f . g)

dumbVoidToList :: Reader () a -> [a]
dumbVoidToList (Reader _) = []

obvious1 :: Reader () a -> [a]
obvious1 (Reader g) = [g ()]

obviousN :: Reader () a -> Int -> [a]
obviousN (Reader g) n = replicate n (g ())

dumbBoolToMaybe :: Reader Bool a -> Maybe a
dumbBoolToMaybe (Reader _) = Nothing

obviousBoolToMaybeTrue :: Reader Bool a -> Maybe a
obviousBoolToMaybeTrue (Reader g) = Just (g True)

obviousBoolToMaybeFalse :: Reader Bool a -> Maybe a
obviousBoolToMaybeFalse (Reader g) = Just (g False)

newtype Op r a = Op (a -> r)

instance Contravariant (Op r) where
  contramap f (Op g) = Op (g . f)

op :: Op Bool Int
op = Op (> 0)

f :: String -> Int
f = read

-- contramap f . alpha = alpha . contramap f

-- how do I write alpha ? 2 options. Not very useful tho
alpha :: Op Bool a -> Op Bool b
alpha _ = Op (const True)

alpha2 :: Op Bool a -> Op Bool b
alpha2 _ = Op (const False)

left :: Op Bool String
left = (contramap f . alpha) op

right :: Op Bool String
right = (alpha . contramap f) op

test :: Op Bool String -> Op Bool String -> String -> Bool
test (Op f) (Op g) str = f str == g str

-- It'd be awesome to test that with quickTest but I am not willing to set it up
main :: IO ()
main = do
  print $ test left right "hola"
  print $ test left right "adeu"