---
layout: post
title: "custom pry commands"
date: Fri Dec  2 13:42:28 PST 2016
---

In a [previous post]({% post_url 2015-11-13-pdb-aliases-are-your-friend %}) I
described how I added some aliases to my `.pdbrc` to dump local vars to a file.

Now that I'm diving deeper into the ecosystem, I wanted to find
out how to do the equivalent in ruby and rails. After some quick googling, I came up with
the following roughly roughly equivalent snippet (and analagously can go into `.pryrc`):

```ruby
Pry::Commands.block_command "dl", "Dump locals to log" do
  vars = target.local_variables.select { |v| !v.to_s.starts_with?('_') }
  foo = Hash[vars.map { |k| [k, target.local_variable_get(k)] }].to_json
  File.open('/tmp/foo.json', 'w') { |f| f.write(foo) }
  output.puts "Dumped locals to \"/tmp/foo.json\""
end
```

For reference: [git commit](https://github.com/cadizm/dotfiles/commit/6d4ae79a74b9963f0f9d9ac71b3720be6aa940e7)
