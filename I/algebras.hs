{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Algebras where

import Data.Monoid

class Monoid a => Group a where
  invert :: a -> a

class Functor f a b where
  fmap :: (a -> b) -> (f a) -> (f b)

