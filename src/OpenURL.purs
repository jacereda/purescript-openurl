module OpenURL where

import Prelude

import Control.Monad.Eff (Eff)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (WINDOW)
import DOM.HTML.Window (open)
import Node.ChildProcess (CHILD_PROCESS)
import Node.OpenURL as Node

foreign import browser :: Boolean

type OpenURLEff e = (cp :: CHILD_PROCESS, dom :: DOM, window :: WINDOW | e)

openURL :: String -> forall e. Eff (OpenURLEff e) Unit
openURL url = 
  if browser
  then void $ window >>= open url "" ""
  else Node.openURL url
