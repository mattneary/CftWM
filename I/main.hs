module Main where

import qualified Ex5 (check)

checks = [Ex5.check]

main = if and checks
       then putStrLn "OK"
       else undefined

