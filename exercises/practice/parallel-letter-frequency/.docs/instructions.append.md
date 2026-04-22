# Instruction Appendix

For building a concurrent/parallel program in Crystal, [might this resource prove useful][resource].
In Crystal 1.19 a new [Sync][sync] library was added which adds several primitives to make it easier to make high performance concurrent/parallel programs.

The online environment for this exercise is a bit different from most other exercises.
Instead of compiling Crystal into a single-threaded binary, this exercises uses Crystal's experimental multi-threading capabilities.
As such, the execution might behave differently than expected in some environments.

For local development, it is recommended that you have Crystal version 1.19.0 or later installed, and add `-Dpreview_mt` flag when compiling or running your code to enable multi-threading support.

[resource]: https://crystal-lang.org/reference/latest/guides/concurrency.html
[sync]: https://crystal-lang.org/api/latest/Sync.html
