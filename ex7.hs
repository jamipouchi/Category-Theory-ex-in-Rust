import Data.Bifunctor (Bifunctor (..))
import Data.Functor.Const (Const (Const))
import Data.Functor.Identity (Identity (Identity))

data Pair a b = Pair a b

instance Bifunctor Pair where
  bimap f g (Pair a c) = Pair (f a) (g c)
  first f (Pair a c) = Pair (f a) c
  second g (Pair a c) = Pair a (g c)

maybeToEitherConstIdentity :: Maybe a -> Either (Const () a) (Identity a)
maybeToEitherConstIdentity Nothing = Left (Const ())
maybeToEitherConstIdentity (Just x) = Right (Identity x)

eitherConstIdentityToMaybe :: Either (Const () a) (Identity a) -> Maybe a
eitherConstIdentityToMaybe (Left (Const ())) = Nothing
eitherConstIdentityToMaybe (Right (Identity x)) = Just x

data Prelist a b = Nil | Cons a b

instance Bifunctor Prelist where
  bimap _ _ Nil = Nil
  bimap f g (Cons a b) = Cons (f a) (g b)

data K2 c a b = K2 c

instance Bifunctor (K2 a) where
  bimap _ _ (K2 c) = K2 c

data Fst a b = Fst a

instance Bifunctor Fst where
  bimap f _ (Fst a) = Fst (f a)

data Snd a b = Snd b

instance Bifunctor Snd where
  bimap _ g (Snd b) = Snd (g b)
