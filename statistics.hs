{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE OverloadedStrings #-}
module Statistics where


import Data.List
import Control.Arrow
import Control.Monad
import Prelude hiding (Real)


type ProbSpace a = [a] --discrete probability space as list.Here a is the parameterized event type
type RandVar a = a -> Float --define random variable as a function whose codomain is number
type Prob a = a->Float --probability of a event of type a

instance Num (RandVar a) where  --so we can use overloaded number operations for random variable.
  (+) :: RandVar a->RandVar a->RandVar a
  (+) a b = \x-> (a x)+(b x)
  (*) :: RandVar a->RandVar a->RandVar a
  (*) a b = \x-> (a x)*(b x)
  (-) :: RandVar a->RandVar a->RandVar a
  (-) a b = \x-> (a x)-(b x)

  
 -- expectation of random variable,discrete version  
expec::ProbSpace a->Prob a->RandVar a->Float --we specify underlying probability space and probabilities explicitly
expec probs p r = foldl1 (+) $ fmap (\w->(r w)*(p w) ) probs

variance::ProbSpace a->Prob a->RandVar a->Float
variance ps p r = expec ps p $ (r - (\_ -> expec ps p r))^2
-- note that the original definition is E((x-E(x))^2) ,which is misleading for that E(x) is just a number rather than  a random variable,but we can make it into one by using  constant function

covariance::ProbSpace a->Prob a->RandVar a->RandVar a->Float
covariance ps p r1 r2 = (expec ps p r1)*(expec ps p r1)-(expec ps p $ r1*r2)

--a simple example
probSpace1::ProbSpace Int
probSpace1=[1,2,3]

weight::RandVar Int
weight x=case lookup x [(1,50),(2,40),(3,70)] of
  Just y->y
  Nothing->error ""

prob::Prob Int
prob x=case lookup x [(1,0.2),(2,0.5),(3,0.3)] of
  Just y->y
  Nothing->error ""
  
expecOfWeight=expec probSpace1 prob weight -- gives 51.0

--continuous case
data RealNum --real number is defined as a abstract type
data ProbSpaceReal = RealSpace RealNum --probability is defined as a abstract container for real number
type RandVarReal = RealNum->RealNum
type ProbReal = RealNum->RealNum


instance Num RealNum where
instance Num RandVarReal where  --so we can use overloaded number operations for random variable
  (*)::RandVarReal->RandVarReal->RandVarReal
  (*) x y = undefined

  
expecR::(ProbSpaceReal->(RealNum->RealNum)->RealNum)->ProbSpaceReal->ProbReal->RandVarReal->RealNum --integral functional,probability space,probability distribution,randvar
expecR integral space p r = integral space (\x->(p x)*(r x))

main=undefined 
