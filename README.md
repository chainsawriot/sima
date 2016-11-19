# sima

Easy to use multi-format serialization interface.

## Usage

File I/O

```{ruby}
Sima.export(obj, "~/output.mar")
obj = Sima.import("~/output.mar")

### Sima can guess the file format you want to serialize/deserialize
Sima.export({:testing => [2,3,4,5,6]}, "~/output.yml")
Sima.import("~/output.yml")
```
dump / load

```{ruby}
Sima.load('[1,2,3,4]', 'json')
Sima.dump({:testing => [2,3,4,5,6]}, 'mpac')
```

## Supported serialization format

| Format | Extension |
| ------ | --------- |
| Marshal | .mar .marshal |
| JSON | .json |
| MessagePack | .mpac .msg .msgpack |
| YAML | .yml .yaml |

## Why this name, Sima?

[Sima](https://en.wikipedia.org/wiki/Sima_(office)) (司馬) is the official rank of Marshal in ancient China.

## Inspirations

-   R: [Serialization Interface for Single Objects](https://stat.ethz.ch/R-manual/R-patched/library/base/html/readRDS.html), [rio](https://github.com/leeper/rio)
