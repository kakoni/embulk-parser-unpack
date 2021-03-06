[![Build Status](https://travis-ci.org/kakoni/embulk-parser-unpack.svg?branch=master)](https://travis-ci.org/kakoni/embulk-parser-unpack)

# Unpack parser plugin for Embulk

Unpack parser. Useful for parsing fixed width format files.
Can be used to transform `FirstSecond Third` line to `{key: "First", key2: "Second", key3: "Third"}`

## Overview

* **Plugin type**: parser
* **Guess supported**: no

## Configuration

- **format**: Unpack format string. [See String#unpack](http://apidock.com/ruby/String/unpack) (string, required)
- **strip_whitespace**: Strip whitespace from parsed values. (bool, default: true)
- **columns**: declares the list of columns, unpacked values will be assigned to these in order.

## Example

```yaml
in:
  type: any file input plugin type
  parser:
    type: unpack
    format: a2a5@10a4 #Extracts three values, first 2 chars, then 5 chars and lastly 4 chars from position 10.
    columns:
    - {name: first, type: string}
    - {name: second, type: string}
    - {name: third, type: string}

```

## Install plugin

```
$ embulk gem install embulk-parser-unpack
```
