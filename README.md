
# alg-statistics
This is my own answer for  https://mathoverflow.net/questions/287058/good-introduction-to-statistics-from-a-algebraic-point-of-view ,currently there are no measure theory .

According to standart statistics book,discrete random variable and probability can be defined as follow:
```haskell
type ProbSpace a = [a] --discrete probability space as list.Here a is the parameterized event type
type RandVar a = a -> Float --define random variable as a function whose codomain is number
type Prob a = a->Float --probability of a event of type a
```
Please view the source file for more info and runnable examples





