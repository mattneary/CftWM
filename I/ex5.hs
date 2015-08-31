{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Ex5 where

-- | Find two different functors T: Grp -> Grp with object
-- | function T(G) = G the identity function for every group
-- | G.

import Prelude (($), (.), (/=), Int)

import Algebras
import Instances
import Data.Monoid

data Id g = Id g
instance (Group a, Group b) => Functor Id a b where
  fmap f (Id x) = Id $ f x

data Const g = Const g
instance (Group a, Group b) => Functor Const a b where
  fmap f (Const x) = Const . f $ mempty

check =
  let Id a = fmap (mappend (1 :: Int)) (Id 1)
      Const b = fmap (mappend (1 :: Int)) (Const 1)
  in a /= b

