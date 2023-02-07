newtype Reader a x = Reader (a -> x)

instance Functor (Reader a) where
  fmap f (Reader g) = Reader (f . g)

instance Representable (Reader a) where
  tabulate = ReaderT . fmap tabulate . curry

data Pair a = Pair a a

instance Representable Pair where
  type Rep Pair = Bool
  tabulate f = Pair (f True) (f False)
  index (Pair x1 x2) b = if b then x1 else x2