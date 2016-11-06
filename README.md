# sima

Data I/O (such as Marshal serialization) for brain-deads.

## Goal

I hate the dance for reading and dumping Marshal. Why it takes so long?

```{ruby}
## dumping
File.open("output.mar", 'wb') { |f| f.write(Marshal.dump(obj)) }

## reading
obj = Marshal.load(File.read("output.mar"))
```

It takes even longer when the file name is a relative path. The goal of `Sima` is to make the above I/O process brain-dead compatible.

```{ruby}
Sima.dump(obj, "~/output.mar")
obj = Sima.load("~/output.mar")
```


## Why this name, Sima?

[Sima](https://en.wikipedia.org/wiki/Sima_(office)) (司馬) is the official rank of Marshal in ancient China.

## Inspirations

-   R: [Serialization Interface for Single Objects](https://stat.ethz.ch/R-manual/R-patched/library/base/html/readRDS.html), [rio](https://github.com/leeper/rio)
