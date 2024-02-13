# Performance

In this article, we'll examine the performance difference between approaches for `raindrops` in Crystal.

The [approaches page][approaches] lists three approaches to this exercise:

1. [Using conditionals][approach-conditionals]
2. [Using data-driven][approach-data-driven]

## Benchmarks

To benchmark the approaches, we wrote a [small benchmark application][benchmark-application] using the built-in [`Benchmark` module][benchmark-module].
These tests were run in WSL2, using Crystal 1.11.2 (llvm 15).
Your system results may vary.

```
RaindropsConditional
  0.000005   0.000000   0.000005 (  0.000003)
RaindropsDataDriven
  0.000003   0.000000   0.000003 (  0.000003)
```

## Conclusion

It is hard to make a conclusion from these results, as the difference is so small.
However, the rules approach is slightly faster than the conditionals approach, but the difference is so small that it is hard to make a definitive conclusion.

[approaches]: https://exercism.org/tracks/crystal/exercises/raindrops/approaches
[approach-conditionals]: https://exercism.org/tracks/crystal/exercises/raindrops/approaches/conditionals
[approach-data-driven]: https://exercism.org/tracks/crystal/exercises/raindrops/approaches/data-driven
[benchmark-application]: https://github.com/exercism/crystal/blob/main/exercises/practice/raindrops/.articles/performance/code/benchmark.cr
[benchmark-module]: https://crystal-lang.org/api/Benchmark.html