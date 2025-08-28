{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_lab01 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/art/cse3160/wk1/lab01/.stack-work/install/x86_64-linux/a9c16cdc10622f70869b239cbc9df40121e4599a48a94aa2232e4c0e952544d7/9.6.7/bin"
libdir     = "/home/art/cse3160/wk1/lab01/.stack-work/install/x86_64-linux/a9c16cdc10622f70869b239cbc9df40121e4599a48a94aa2232e4c0e952544d7/9.6.7/lib/x86_64-linux-ghc-9.6.7/lab01-0.1.0.0-LdRR4ygujROES0jCqQZkOp-lab01-test"
dynlibdir  = "/home/art/cse3160/wk1/lab01/.stack-work/install/x86_64-linux/a9c16cdc10622f70869b239cbc9df40121e4599a48a94aa2232e4c0e952544d7/9.6.7/lib/x86_64-linux-ghc-9.6.7"
datadir    = "/home/art/cse3160/wk1/lab01/.stack-work/install/x86_64-linux/a9c16cdc10622f70869b239cbc9df40121e4599a48a94aa2232e4c0e952544d7/9.6.7/share/x86_64-linux-ghc-9.6.7/lab01-0.1.0.0"
libexecdir = "/home/art/cse3160/wk1/lab01/.stack-work/install/x86_64-linux/a9c16cdc10622f70869b239cbc9df40121e4599a48a94aa2232e4c0e952544d7/9.6.7/libexec/x86_64-linux-ghc-9.6.7/lab01-0.1.0.0"
sysconfdir = "/home/art/cse3160/wk1/lab01/.stack-work/install/x86_64-linux/a9c16cdc10622f70869b239cbc9df40121e4599a48a94aa2232e4c0e952544d7/9.6.7/etc"

getBinDir     = catchIO (getEnv "lab01_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "lab01_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "lab01_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "lab01_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab01_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
