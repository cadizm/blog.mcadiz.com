---
layout: post
title: "Symmetric Key Encryption with XOR Reciprocal Cipher"
date: Fri Mar 10 17:08:01 PST 2017
---

For very basic (and weak) encryption using a shared secret, one might want
to consider using an [XOR Cipher](https://en.wikipedia.org/wiki/XOR_cipher)
for non-sensitive data for to ease of implementation.

Here's 3 implementations I needed for distribution to different code bases:

```python
# cipher.py

def xor(s, t):
    return ''.join(chr(ord(a) ^ ord(b)) for a, b in zip(s, t))

def pad(s, char=' ', padlen=16):
    n = len(s)
    if n < padlen:
        s += char * (padlen - n)
    return s

def encrypt(key, text):
    from binascii import hexlify
    return hexlify(xor(key, pad(text)))

def decrypt(key, cipher_text):
    from binascii import unhexlify
    return xor(key, unhexlify(cipher_text)).strip()

if __name__ == '__main__':
    key = 'I|tF&T=RMYmtU|80~N`"16v~&V>D"J|['
    msg = '101237'

    cipher_text = encrypt(key, msg)
    decrypted_text = decrypt(key, cipher_text)

    assert decrypted_text == msg
    print cipher_text, decrypted_text
```

```ruby
# cipher.rb

def xor(s, t)
  s, t = t, s if s.size > t.size
  s.chars.zip(t.chars).map { |a, b| (a.ord ^ b.ord).chr }.join
end

def pad(s, char=' ', padlen=16)
  n = s.size
  s = n < padlen ? s + char * (padlen - n) : s
end

def encrypt(key, text)
  xor(key, pad(text)).unpack("H*").join
end

def decrypt(key, cipher_text)
  xor(key, [cipher_text].pack("H*")).strip
end

if $0 == __FILE__
  key = 'I|tF&T=RMYmtU|80~N`"16v~&V>D"J|['
  msg = '101237'

  cipher_text = encrypt(key, msg)
  decrypted_text = decrypt(key, cipher_text)

  raise if decrypted_text != msg
  puts "#{cipher_text} #{decrypted_text}"
end
```

```java
// Cipher.java

class Cipher {
    private String key;

    public Cipher(String key) {
        this.key = key;
    }

    public String encrypt(String text) {
        return hexlify(xor(this.key, pad(text, ' ', 16)));
    }

    public String decrypt(String cipherText) {
        return xor(this.key, unhexlify(cipherText)).trim();
    }

    private static String xor(String s, String t) {
        int n = s.length() < t.length() ? s.length() : t.length();

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < n; ++i) {
            int a = (int)s.charAt(i);
            int b = (int)t.charAt(i);

            sb.append((char)(a ^ b));
        }

        return sb.toString();
    }

    private static String pad(String s, char c, int padlen) {
        int n = s.length();

        if (n < padlen) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < padlen - n; ++i) {
                sb.append(c);
            }
            s += sb.toString();
        }

        return s;
    }

    private static String hexlify(String s) {
        String hex = "";
        for (byte b : s.getBytes()) {
            hex += String.format("%02x", b);
        }
        return hex;
    }

    private static String unhexlify(String s) {
        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < s.length(); i += 2) {
            String hex = s.substring(i, i + 2);
            sb.append((char)Integer.parseInt(hex, 16));
        }

        return sb.toString();
    }

    public static void main(String[] args)
        throws Exception
    {
        Cipher cipher = new Cipher("I|tF&T=RMYmtU|80~N`\"16v~&V>D\"J|[");
        String msg = "101237";

        String cipherText = cipher.encrypt(msg);
        String decryptedText = cipher.decrypt(cipherText);

        if (!decryptedText.equals(msg)) {
            throw new Exception();
        }

        System.out.printf("%s %s\n", cipherText, decryptedText);
    }
}
```
