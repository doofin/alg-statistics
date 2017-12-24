
# statistics from a more algebraic point of view
This is my own answer for  https://mathoverflow.net/questions/287058/good-introduction-to-statistics-from-a-algebraic-point-of-view ,currently there are no measure theory .

According to standart statistics book,discrete random variable and probability can be defined as follow:
```haskell
type ProbSpace a = [a] --discrete probability space as list.Here a is the parameterized event type
type RandVar a = a -> Float --define random variable as a function whose codomain is number
type Prob a = a->Float --probability of a event of type a
```
Please view the source file for more info and runnable examples.

As a functional programer,I find machine learning painful to learn due to so many unprecise notation,and statistics is the cornerstone of that,and this is my attempt to alleviate current situation.Contributations are welcome!(measure theory,statistical learning..etc)

Initially I plan to implement these in Agda but I found nothing like type synonyms in haskell,which would be quite inconvenient,But in the future i plan to do theorem proving in agda with hott library(https://github.com/HoTT/HoTT-Agda)
