module OpenURL where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM)
import DOM.HTML (window)
import DOM.HTML.Types (WINDOW)
import DOM.HTML.Window (open)
import Data.Maybe (Maybe(..))
import Node.ChildProcess (CHILD_PROCESS)
import Node.OpenURL as Node

foreign import browser :: Boolean

type OpenURLEff e = (console :: CONSOLE, cp :: CHILD_PROCESS, dom :: DOM, window :: WINDOW | e)

openURL :: String -> forall e. Eff (OpenURLEff e) Unit
openURL url = 
  if browser
  then window >>= open url "" "" >>= case _ of
    Just _ -> pure unit
    _ -> log "Unable to open window, unblock popup windows in your browser"
  else Node.openURL url
