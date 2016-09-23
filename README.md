# Unpack parser plugin for Embulk

Unpack parser

## Overview

* **Plugin type**: parser
* **Guess supported**: no

## Configuration

- **format**: Unpack format string. [See String#unpack](http://apidock.com/ruby/String/unpack) (string, required)

## Example

```yaml
in:
  type: any file input plugin type
  parser:
    type: unpack
    format: a2a5@10a4
```

(If guess supported) you don't have to write `parser:` section in the configuration file. After writing `in:` section, you can let embulk guess `parser:` section using this command:

```
$ embulk gem install embulk-parser-unpack
$ embulk guess -g unpack config.yml -o guessed.yml
```

## Build

```
$ rake
```
