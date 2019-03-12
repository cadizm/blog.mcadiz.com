---
layout: post
title: "Ordered Symbol Table ADT in C++ map"
date: Mon Mar 11 18:21:42 PDT 2019
---

C++'s ordered `std::map` (usually implemented with [red-black trees](http://en.wikipedia.com/wiki/Red%E2%80%93black_tree)),
satisfies the requirements for the [Ordered Symbol Table](https://algs4.cs.princeton.edu/31elementary/)
abstract data type.

Some examples of how the ST interface might be mapped and take advantage of a wrapped `std::map` and
make use of an ordered symbol table's relative key ordering:

```cpp
  // Largest key less than or equal to key
  const K* floor(K key) {
    if (isEmpty())
      return nullptr;

    // lower_bound returns iterator to first element not less than key
    auto candidate = map.lower_bound(key);
    if (candidate == map.begin())
      return &candidate->first;

    return &(--candidate)->first;
  }

  // Smallest key greater than or equal to key
  const K* ceiling(K key) {
    if (isEmpty())
      return nullptr;

    // upper_bound returns iterator to the first element greater than key
    return &map.upper_bound(key)->first;
  }

  // Number of keys less than key
  // i == rank(select(i)) for all 0 <= i <= size() - 1
  int rank(K key) {
    return std::distance(map.begin(), map.lower_bound(key));
  }

  // Key of rank k
  // key == select(rank(key)) for all keys in map
  const K* select(int k) {
    int low = 0;
    int high = size() - 1;

    // binary search
    while (low <= high) {
      auto it = map.begin();
      int mid = low + ((high - low) / 2);

      std::advance(it, mid);
      int rank = std::distance(map.begin(), it);

      if (rank < k) {
        low = mid + 1;  // look to the right
      } else if (rank > k) {
        high = mid - 1;  // look to the left
      } else {
        return &it->first;
      }
    }

    return nullptr;
  }

  // Number of keys in [low, high]
  int size(K low, K high) {
    auto begin = map.lower_bound(low);
    auto end = map.upper_bound(high);

    return std::distance(begin, end);
  }

  // Keys in [low, high], in sorted order
  std::vector<K> keys(K low, K high) {
    auto begin = map.lower_bound(low);
    auto end = map.upper_bound(high);

    std::vector<K> res;
    for (auto it = begin; it != end; ++it) {
      res.push_back(it->first);
    }

    return res;
  }
```
