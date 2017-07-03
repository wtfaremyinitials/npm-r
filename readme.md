![](https://img.shields.io/npm/dm/npm-r.svg)
![](https://img.shields.io/npm/v/npm-r.svg)
![](https://img.shields.io/npm/l/npm-r.svg)

npm-r
===

> a faster `npm run`

Run an npm package script without starting unnecessary node processes.
Roughly 10x faster than `npm run`.

```
$ npm-r test
> ava --verbose

  ✔ script execution (182ms)
  ✔ multiline (181ms)
  ✔ undefined return (185ms)
  ✔ callback mode (178ms)
  ✔ system access (297ms)

  5 tests passed [17:48:00]
```

Installation
===

for use in your shell

`npm install -g npm-r`

for use inside package scripts (recursion!)

`npm install --save npm-r`

Benchmark
===

```
$ time npm run benchmark
[snip]
real    0m0.308s
user    0m0.232s
sys     0m0.055s

$ time npm-r benchmark
[snip]
real    0m0.026s
user    0m0.011s
sys     0m0.009s

$ cat package.json
{
    "scripts": {
        "benchmark": "echo Hello World"
    }
}
```
