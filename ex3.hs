compose :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)
--compose f g x = g =<< f x
compose f g = \x -> case f x of
  Nothing -> Nothing
  Just y -> g y

identity :: a -> Maybe a
identity = Just

safeReciprocal :: Float -> Maybe Float
safeReciprocal 0 = Nothing
safeReciprocal x = Just (1 / x)

safeRoot :: Float -> Maybe Float
safeRoot 0 = Nothing
safeRoot x = Just (sqrt x)

safeRootReciprocal = compose safeReciprocal safeRoot