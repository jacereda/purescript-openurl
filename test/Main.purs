module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import OpenURL (OpenURLEff, openURL)

main :: forall e. Eff (OpenURLEff e) Unit
main = openURL "http://www.google.com"
