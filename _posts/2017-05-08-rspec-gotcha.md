---
layout: post
title: "RSpec gotcha (err me)"
date: Mon May  8 10:49:09 PDT 2017
---

Spent a good half hour trying to figure out why the following spec was failing:

```ruby
describe '#create' do
  it 'receives handle_event callback' do
    params[:foo] = 'bar'
    post :create, params: params
    expect(Foo::Bar).to receive(:new)
  end
end
```

After coming back to it the next day with a clearer head (and more patient
googling), I realized that the expectation is that message will be received
in the _future_. Doh!

So this should be:

```ruby
describe '#create' do
  it 'receives handle_event callback' do
    expect(Foo::Bar).to receive(:new)
    params[:foo] = 'bar'
    post :create, params: params
  end
end
```
