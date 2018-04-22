module Lib
    ( someFunc
    ) where

foreign import ccall "wrap_acc_init" cWrapAccnit
  :: IO ()

someFunc :: IO ()
someFunc = cWrapAccnit
