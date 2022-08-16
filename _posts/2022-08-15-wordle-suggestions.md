---
layout: post
title: "Wordle Suggestions"
date: Mon Aug 15 09:06:46 PDT 2022
---

I've recently finished adding [Wordle](https://dev.cadizm.com/wordle/) to my
short list of "word game helper" apps. After playing a couple of times unaided by
a computer, it seemed fun to put together a short algorithmic solution to help
ensure a continued 100% win streak! You can find the source [here](https://github.com/cadizm/wordle).
Continue reading for an overview of the approach and an analysis of Big $$O$$ time complexity.

First a short [snippet](https://github.com/cadizm/wordle/blob/566bc631e67a239002d0c7ca79d1ff092d1d10af/wordle.py#L107-L111) of the high-level logic:

```python
def suggest(wordle, excluded, included, misplaced):
  """
  Client entrypoint for suggesting Wordle solutions.
  """
  return score(discard(misplaced, search(wordle, exclude(excluded, include(included, corpus)))))
```

The intent is to:
1. Use a list of all known 5 letter English words ("corpus")
2. Include from the corpus, words that "include" a given set of letters
3. Exclude form the corpus, words that "exclude" a given set of letters
4. Search this subset of included/excluded words for words matching a "wordle"
   guess (using "." for positions whose letter we do not know (shaded gray in
   Wordle) and the actual letter itself for those correctly positioned (Wordle
   shaded green))
5. Subtracting from the search, words that have letters that we know are "misplaced"
   (in Wordle these are shaded yellow)
6. Finally score the words remaining after performing the above and return in descending
   score order

Quick definition for variables used in analysis. $$n$$ will be bound to the size of the
corpus, and $$k$$ to the size of the input for _each_ of the functions above. For example,
in the call:

```python
exclude(excluded, include(included, corpus))
```

$$n$$ is size of corpus, $$k$$ is the variable used to describe the sizes of both
included and excluded, with the understanding that size $$k$$ passed in the invocation
to `include` is not necessarily the same $$k$$ passed to `exclude`, but is of course
required to be strictly <= the initial $$k$$ passed to `include`.

Time complexity for [include](https://github.com/cadizm/wordle/blob/566bc631e67a239002d0c7ca79d1ff092d1d10af/wordle.py#L15-L19):

```python
def include(letters, corpus):
  """
  Return words in corpus that include all letters in `letters`.
  """
  return set(filter(lambda word: set(word) & set(letters) == set(letters), corpus))
```

A single pass over each word in corpus is done, so this already requires $$O(n)$$ time.
At each iteration we are performing a set intersection operation which takes $$O(min(m, n))$$
time. In our case using $$k$$ for letters, we know that letters we want to include have an
upper bound of 5 since all Wordle words are 5 letters. And each of the words in our corpus
are 5 letters by definition. This implies that although the theoretical upper bound is
$$O(k \cdot n) = O(5 \cdot n) $$, we can extract and drop our constant $$k$$, leaving
$$5 \cdot O(n) \rightarrow O(n)$$ linear time for the include operation.

Similar analysis can be used for `exclude`, although our constant size will be slightly larger:
There are 26 letters in the English alphabet so we know that $$k$$ in this case has to at least
be <= 26. We can get a tighter bound by realizing that our corpus is restricted to 5 letter
words and that 2 seems to be the [minimum](https://puzzling.stackexchange.com/questions/37762/five-letter-english-word-that-contains-only-two-distinct-letters)
number of letters possible for valid words. So even if we are extremely unlucky in letter
guessing, our upper bound is constrained to constant size $$26 - 2 = 24$$.

The [search](https://github.com/cadizm/wordle/blob/master/wordle.py#L36-L40) operation
follows analogously, as we are again doing a single pass with a constant time check
to apply our regular expression, which simplifies to a single pass over our regex and
strings, both of which are fixed at 5.

Only when we apply [discard](https://github.com/cadizm/wordle/blob/master/wordle.py#L50-L54)
do we get a seemingly quadratic upper bound when we apply the $$O(n)$$ search operation for
each member of misplaced. But if we again think about the maximum size of misplaced, we can
convince ourselves that it is again upper bounded at 5! (In the unlikely case that we have
correctly identified all 5 letters, all of which are in the incorrect position.)

I hope to have shown that Wordle's restriction to valid 5 letter words greatly reduces the
size of inputs to our functions which can be leveraged to arrive at a tighter bounded linear
running time (excluding scoring which has been omitted and will come in a future post since
this one is is already a bit lengthy).
