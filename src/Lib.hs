-- Inspired by https://aphyr.com/posts/342-typing-the-technical-interview and
-- https://wiki.haskell.org/wikiupload/d/dd/TMR-Issue8.pdf. See the latter for a well-paced
-- introduction to what's going on in general.

-- Allows one type parameter to a class to be fully determined by the type of another.
{-# LANGUAGE FunctionalDependencies #-}

-- The head of an instance declaration may mention arbitrary nested types.
{-# LANGUAGE FlexibleInstances #-}

-- Lifts rules that would ensure the typechecker always terminates when checking instance
-- declarations. <devilface.jpg>
{-# LANGUAGE UndecidableInstances #-}

module Lib
    ( runLoop
    ) where


-- The following class is conceptually similar, on the type level, to the following term-level function.
-- loop :: a -> b
-- loop x = let y = loop [x] in loop y

class Loop a b | a -> b where -- using FunctionalDependencies
  runLoop :: a -> b
instance (Loop [x] y) => Loop x y -- using FlexibleInstances
