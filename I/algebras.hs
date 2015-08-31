{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Algebras where

class Group a where
  (<*>) :: a -> a -> a
  gid :: a

class Functor f a b where
  fmap :: (a -> b) -> (f a) -> (f b)

