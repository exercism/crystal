# Concept Tree

This is a concept tree for the Crystal Syllabus. 
It is a work in progress, it was last updated on 2024-01-13.
Each concept with an exercise around it has been implemented, the rest is still to be implemented.


```mermaid
graph TD

    subgraph A [Lasagna]
        a[Basics]
    end

    subgraph B [Crystal Hunter]
        b(bools)
    end

    subgraph J [Number Types]
        ac(Number Types)
    end

    subgraph C [Wellington's Weather Station]
        c(Numbers)
    end

    subgraph E [Johannes' Juice Maker]
        e(Classes)
    end

    subgraph F [Party Robot]
        f(Strings)
    end

    subgraph S [Foto Fusionist]
        d(binary & octal & hexadecimal)
    end

    subgraph T [Secrets]
        ad(Bit Manipulation)
    end

    subgraph G [High School Sweetheart]
        g(string methods)
    end

    subgraph H [Meltdown Mitigation]
        h(conditionals)
    end

    subgraph I [Interest is intresting]
        i(return)
        j(while)
    end

    subgraph K [Bellebrook Basket League]
        k(modules)
    end

    subgraph L [Blackjack]
        v(case /switch/)
    end

    subgraph M [Castle Dinner]
        o(Nil)
    end

    subgraph N [Library of Luton]
        l(Char)
    end

    subgraph O [Password Lock]
        w(Union type)
    end

    subgraph P [Chess Game]
        n(Range)
    end

    subgraph Q [Language List]
        q(Arrays)
    end

    subgraph R [Chaitana's Colossal Coaster]
        r(Array-methods)
    end

    subgraph U [Task Handler]
        s(Blocks/proc/)
    end

    A --> B
    A --> C
    B --> J
    C --> E
    E --> F
    F --> G
    G --> H
    H --> I
    J --> E
    H --> K
    H --> L
    H --> M
    I --> N
    N --> O
    M --> O
    N --> P
    P --> Q
    O --> Q
    Q --> R
    F --> S
    S --> T
    R --> U
    U --> t



    m(Getters/setters)
    p(raising errors)
    s(Blocks/proc/)
    t(enumeration)
    u(more enumeration)
    x(symbols)
    y(Tuples)
    z(Hashes)
    aa(Named Tuple)
    ab(Decomposition & multiple assignment)

    Q --> p
    t --> u
    u --> y
    u --> x
    x --> z
    y --> z
    z --> aa
    aa --> ab
    E --> m
```