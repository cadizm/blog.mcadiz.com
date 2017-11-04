---
layout: post
title: "Products and trees"
date: Sat Nov  4 16:40:47 PDT 2017
---

```python
def product_others(L):
    """
    Return an array M where the value at each index i is the product
    of all values in L except for L[i]

    Constraint: only use multiplication operator
    """
    product = lambda x, y: x * y

    # value at index i is the product of all prev in L
    before = [
        reduce(product, L[:i], 1)
        for i in range(len(L))
    ]

    # value at index i is the product of all next in L
    after = [
        reduce(product, L[i+1:], 1)
        for i in range(len(L))
    ]

    return [x * y for (x, y) in zip(before, after)]


def reconstruct(inorder, postorder):
    """
    Reconstruct and return the root of the tree that yields the
    passed inorder and postorder traversals
    """
    assert len(inorder) == len(postorder)

    if not inorder:
        return

    # root is always last entry
    root = Node(postorder[-1])
    # find index of root in inorder
    i = inorder.index(root.data)

    # left subtree of tree rooted at root
    inorder_left = inorder[:i]
    # right subtree of tree rooted at root
    inorder_right = inorder[i+1:]

    postorder_left = postorder[:i]
    postorder_right = postorder[len(postorder_left):-1]

    root.left = reconstruct(inorder_left, postorder_left)
    root.right = reconstruct(inorder_right, postorder_right)

    return root


if __name__ == '__main__':
    L = [2, 4, 1, 3]
    assert [12, 6, 24, 8] == product_others(L)

    #
    #           1
    #          / \
    #         2   3
    #        / \ / \
    #       4  5 6  7
    #        \
    #         8
    #
    t1 = Node(1)
    t1.left = Node(2)
    t1.right = Node(3)
    t1.left.left = Node(4)
    t1.left.right = Node(5)
    t1.right.left = Node(6)
    t1.right.right = Node(7)
    t1.left.left.right = Node(8)

    A, B = [], []
    inorder(t1, A)
    postorder(t1, B)

    t2 = reconstruct(A, B)

    C, D = [], []
    inorder(t2, C)
    postorder(t2, D)

    assert A == C
    assert B == D
```
