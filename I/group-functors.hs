{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ExistentialQuantification #-}
module GroupFunctors where

class Group a where
  (<*>) :: a -> a -> a
  gid :: a

instance Group Int where
  (<*>) = (+)
  gid = 0

class Functor' f a b where
  fmap' :: (a -> b) -> (f a) -> (f b)

data GId g = GId g deriving Show
instance (Group a, Group b) => Functor' GId a b where
  fmap' f (GId x) = GId $ f x

data GConst g = GConst g deriving Show
instance (Group a, Group b) => Functor' GConst a b where
  fmap' f (GConst x) = GConst . f $ gid
groups1 = fmap' ((1 :: Int) <*>) (GId 1)
groups2 = fmap' ((1 :: Int) <*>) (GConst 1)

test :: (Show a) => a -> IO ()
test = putStrLn . show
main =
  do test groups1
     test groups2

