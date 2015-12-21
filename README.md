# Musa [![Build Status](https://img.shields.io/travis/chrisenytc/musa/master.svg)](http://travis-ci.org/chrisenytc/musa) [![GEM version](https://img.shields.io/gem/v/musa.svg)](https://rubygems.org/gems/musa) [![Gem Downloads](https://img.shields.io/gem/dt/musa.svg)](https://rubygems.org/gems/musa) [![Code Climate](https://img.shields.io/codeclimate/github/chrisenytc/musa.svg)](https://codeclimate.com/github/chrisenytc/musa) [![Issue Count](https://codeclimate.com/github/chrisenytc/musa/badges/issue_count.svg)](https://codeclimate.com/github/chrisenytc/musa) [![Tips](https://img.shields.io/gratipay/musa.svg)](https://gratipay.com/musa/)

> A awesome tool to manage sensitive environment variables in your development environment

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'musa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install musa

## Usage

#### Encrypt a string

```ruby
require 'musa'

sensitive_data = 'My top secret data'
key = '7f6de8pg52s7135ebhmjk6qzmbsms3eg' # Key length need to be greater than or equal to 32

encrypted_data = Musa::Encryption::encrypt key, sensitive_data
```

#### Decrypt a string

```ruby
require 'musa'

encrypted_data = 'ANdNxjWh0e7QqdVT5WZFlyynZYeB95z/TGFY8yBmBtY=\n'
key = '7f6de8pg52s7135ebhmjk6qzmbsms3eg' # Key length need to be greater than or equal to 32

decrypted_data = Musa::Decryption::decrypt key, encrypted_data
```

#### Encrypt a file

```ruby
require 'musa'

key = '7f6de8pg52s7135ebhmjk6qzmbsms3eg' # Key length need to be greater than or equal to 32

encrypted_data = Musa::Encryption::encrypt_file key, 'sensitive_file.txt', 'encrypted_data.txt'
```

#### Decrypt a file

```ruby
require 'musa'

key = '7f6de8pg52s7135ebhmjk6qzmbsms3eg' # Key length need to be greater than or equal to 32

decrypted_data = Musa::Decryption::decrypt_file key, 'encrypted_data.txt', 'decrypted_data.txt'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/chrisenytc/musa](https://github.com/chrisenytc/musa). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it [chrisenytc/musa](https://github.com/chrisenytc/musa/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The MIT License

Copyright (c) 2015, Christopher EnyTC

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

