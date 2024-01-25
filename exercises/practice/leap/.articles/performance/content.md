# Performance

In this article, we'll examine the performance difference between approaches for `leap` in Crystal.

The [approaches page][approaches] lists three approaches to this exercise:

1. [Using boolean-chain][approach-boolean-chain]
2. [Using `case`][approach-case]
3. [Using rules][approach-rules]

## Benchmarks

To benchmark the approaches, we wrote a [small benchmark application][benchmark-application] using the built-in [`Benchmark` module][benchmark-module].
These tests were run in WSL2, using Crystal 1.11.2 (llvm 15).
Your system results may vary.

```
YearCase
  0.000002   0.000000   0.000002 (  0.000002)
YearBooleanChain
  0.000001   0.000000   0.000001 (  0.000001)
YearRules
  0.000002   0.000000   0.000002 (  0.000002)
```

## Conclusion

It is hard to make a conclusion from these results, as the difference is so small.
The boolean-chain approach is quite light when it comes to method calls, which is why it might be a tiny bit faster.
Although as the difference is so small, and doesn't matter unless you want to do a ton of operations.

[approaches]: https://exercism.org/tracks/crystal/exercises/leap/approaches
[approach-boolean-chain]: https://exercism.org/tracks/crystal/exercises/leap/approaches/boolean-chain
[approach-case]: https://exercism.org/tracks/crystal/exercises/leap/approaches/case
[approach-rules]: https://exercism.org/tracks/crystal/exercises/leap/approaches/rules
[benchmark-application]: https://github.com/exercism/crystal/blob/main/exercises/practice/leap/.articles/performance/code/benchmark.cr
[benchmark-module]: https://crystal-lang.org/api/Benchmark.html
