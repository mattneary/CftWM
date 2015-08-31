module Instances where

import Algebras
import Data.Monoid

instance Monoid Int where
  mappend = (+)
  mempty = 0
instance Group Int where
  invert = negate 

