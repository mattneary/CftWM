{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Ex5 where

-- | Find two different functors T: Grp -> Grp with object
-- | function T(G) = G the identity function for every group
-- | G.

import Prelude (($), (.), Int, (+), (/=))
import Algebras

instance Group Int where
  (<*>) = (+)
  gid = 0

data Id g = Id g
instance (Group a, Group b) => Functor Id a b where
  fmap f (Id x) = Id $ f x

data Const g = Const g
instance (Group a, Group b) => Functor Const a b where
  fmap f (Const x) = Const . f $ gid

check =
  let Id a = fmap ((1 :: Int) <*>) (Id 1)
      Const b = fmap ((1 :: Int) <*>) (Const 1)
  in a /= b

