#### 0.2.1+1
  * Fix toString calls on Type instances.

#### 0.2.0+3
  * Widen the constraint on analyzer.

#### 0.2.0+2
  * Widen the constraint on barback.

#### 0.2.0+1
  * Switch from `source_maps`' `Span` class to `source_span`'s `SourceSpan`
    class.

#### 0.2.0
  * Static configuration can be modified, so code generators can split the
    static configuration in pieces.
  * **breaking change**: for codegen call `writeStaticConfiguration` instead of
    `writeInitCall`.

#### 0.1.0
  * Initial release: introduces the smoke API, a mirror based implementation, a
    statically configured implementation that can be declared by hand or be
    generated by tools, and libraries that help generate the static
    configurations.
