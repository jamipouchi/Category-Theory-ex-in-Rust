maybeToEitherVoid :: Maybe a -> Either () a
maybeToEitherVoid (Just a) = Right a
maybeToEitherVoid Nothing = Left ()

eitherVoidToMaybe :: Either () a -> Maybe a
eitherVoidToMaybe (Left _) = Nothing
eitherVoidToMaybe (Right a) = Just a

data Shape = Circle Float | Rect Float Float | Square Float

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rect w h) = w * h
area (Square s) = s * s

circ :: Shape -> Float
circ (Circle r) = 2 * pi * r
circ (Rect w h) = 2 * (w + h)
circ (Square s) = 4 * s

-- a + a = 2 * a for types, where 2 is Bool
sumEqualsMultBy2 :: Either a a -> (Bool, a)
sumEqualsMultBy2 (Left a) = (False, a)
sumEqualsMultBy2 (Right a) = (True, a)

multBy2EqualsSum :: (Bool, a) -> Either a a
multBy2EqualsSum (False, a) = Left a
multBy2EqualsSum (True, a) = Right a