# Hierarchies, Relations, and Collections

## The Three Fundamental Semantic Relations

Knowledge organization relies on three basic types of semantic relations between concepts:

1. **IS-A** (taxonomic/subsumption): A subtype relationship
   - Example: "Width IS-A dimensional property"
   
2. **PART-OF** (mereological/composition): A component relationship
   - Example: "Optical window PART-OF reactor"
   
3. **HAS-A** (attribution/possession): A property relationship
   - Example: "Substrate HAS-A width"

Understanding these distinctions is essential for correctly structuring vocabularies and avoiding semantic confusion.

## Core Principles

### Using skos:narrower / skos:broader for IS-A Relations Exclusively

The SKOS standard does not constrain the type of hierarchy expressed with the relations `skos:broader` and `skos:narrower`.
While SKOS focuses on "IS-A" relations (car is a vehicle),
expressing part-whole relations (tire is part of car) would also be possible.
However, **Voc4Cat is designed as a taxonomy that organizes concepts by subject**.
Therefore, the type of relations between concepts to create hierarchies are strictly "IS-A" relationships,
and `skos:broader` and `skos:narrower` are only used to express IS-A (but not for PART-OF or HAS-A relations).

Thus, Voc4Cat focuses on categorizing things by what they are.
Such **subject hierarchies** with **IS-A** based hierarchies correspond well with ontological modeling and reasoning as well as semantic search.

**Correct usage:**

```turtle
:Width skos:broader :DimensionalProperty .
# "Width IS-A Dimensional Property" (taxonomic)
```

**Anti-patterns:**

```turtle
:SubstrateWidth skos:broader :Substrate .
# Wrong: Confuses HAS-A ("Substrate HAS-A width") with IS-A

:OpticalWindow skos:broader :Reactor .
# Wrong: Confuses PART-OF ("Window PART-OF reactor") with IS-A
```

### Single Location per Attribute Concept

Each attribute concept should appear **once** in the hierarchy at its most appropriate taxonomic level, based on IS-A relations.

**Don't create object-specific attribute concepts:**

```turtle
:Width a skos:Concept ;
    skos:broader :DimensionalProperty .

:SubstrateWidth a skos:Concept ;
    skos:broader :Width .
    
:FilmWidth a skos:Concept ;
    skos:broader :Width .
```

**Problem**: Unnecessary proliferation of concepts. 
While these technically follow IS-A logic, they create redundancy.
The single concept `Width` can be applied to various objects (substrate, film, reactor) through data annotation metadata.

**Create a generic attribute concept:**

```turtle
:Width a skos:Concept ;
    skos:broader :DimensionalProperty .
    # This single concept can be applied to substrates, films, reactors, etc.
```

### Avoid Mixing Entity and Attribute Hierarchies

A more fundamental error is placing attribute concepts under entity concepts:

**Never do this:**

```turtle
:Substrate a skos:Concept ;
    skos:broader :PhysicalEntity .
    
:SubstrateWidth a skos:Concept ;
    skos:broader :Substrate .
    # Wrong: "Width" is not a subtype of "Substrate"
```

### Using skos:Collection for HAS-A and Contextual Relations

For other use cases, grouping concepts by topic is valuable.
For such groupings, `skos:Collection` should be used.
In Voc4Cat, `skos:Collection` may be used to create topic-wise lists or even for representing list-of-lists.
In this topic-wise form of organization, PART-OF relations, HAS-A relations, or even looser relations (e.g., `skos:related`) dominate.

Use collections to express **HAS-A relationships** and group attributes by context:

- **Object context** (e.g., substrate attributes, reactor parameters)
  - Expresses: "Substrate HAS-A {width, thickness, material}"
- **Measurement technique** (e.g., XRF-measurable attributes)
  - Expresses: "XRF HAS-A {set of measurable attributes}"
- **Application domain** (e.g., photocatalysis parameters)

An example for such a collection in Voc4Cat is [voc4cat:0007130](https://w3id.org/nfdi4cat/voc4cat_0007130), which collects the attribute terms for Scanning Electron Microscopy (SEM) measurements.

### Expressing PART-OF Relations

PART-OF relationships between physical entities should **not** be modeled in Voc4Cat.

**Example of what NOT to do:**
```turtle
:OpticalWindowThickness skos:broader :ReactorDimensions .
# Mixes PART-OF (optical window PART-OF reactor) with attribute hierarchy
```

PART-OF relations should be modeled in a **separate data model or ontology** which may reference concepts from Voc4Cat. Voc4Cat focuses exclusively on providing well-defined concepts that can be used as building blocks in such data models, but does not itself express compositional relationships between physical entities.

### Context from Metadata, Not Vocabulary Structure

**HAS-A** and **PART-OF** relationships are expressed in data annotation metadata, not in the vocabulary hierarchy.

**In data annotation:**
- Attribute concept: URI reference to `voc4cat:Width`
- Measured object (HAS-A): Specified in metadata field (e.g., "substrate HAS-A width")
- Object composition (PART-OF): Specified in metadata (e.g., "substrate PART-OF thin film")
- Measurement device: Specified in metadata field

### Benefits for Data Annotation

1. **Semantic clarity**: Each relation type handled appropriately
2. **Unambiguous concept URIs**: One URI per semantic concept following IS-A logic
3. **Simple queries**: "Find all width measurements" queries a single concept
4. **Maintainable**: No proliferation of concepts mixing relation types
5. **Flexible**: Collections express HAS-A relations without hierarchy pollution
6. **Extensible**: New objects or measurement techniques don't require new attribute concepts

## Voc4Cat Top-Concepts

The concepts included in Voc4Cat are structured under the following **Top-Concepts**:

|     | **Compact URI**     | **Top-Concept**               | **Definition**                                                                                                                                                      |
| --- | ------------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | voc4cat:0000180     | Physical entity               | Entity with a concrete and physical nature.                                                                                                                         |
| 2   | voc4cat:0000181     | Non-temporal abstract entity  | Any entity that cannot be located in space-time. E.g., mathematical entities, formal semantics elements, regions within dimensional spaces, ideas, models.          |
| 3   | voc4cat:0000182     | Temporal abstract entity      | Anything that has a temporal dimension, whether it is an instantaneous point in time, a duration, or a sequence of events.                                          |
| 3.1 | voc4cat:0000183     | Events                        | An occurrence or happening, marked by a specific point in time. Events can be observed, recorded, and may have an impact on the state of the system or entities involved. |
| 3.2 | voc4cat:0000184     | Actions                       | Temporal entities that have a duration and occur at specific points in time.                                                                                        |
| 3.3 | voc4cat:0000185     | Processes                     | A series of temporal entities, like actions, events, changes, or functions that are not isolated but rather a connected sequence of activities. Processes often involve the transformation of inputs into outputs and can be conceptualized as workflows. |
| 4   | voc4cat:0000186     | Attributes                    | A characteristic of an entity that is intrinsic to and cannot exist without the entity. (Properties, characteristics, qualities of things, states).                 |

These top concepts are similar to those in top-level ontologies (BFO, SIO, DOLCE), to what is proposed in ANSI/NISO Z39.19-2005 (R2010), or what was proposed as minimal set of terms for a re-organization of AgroVoc.

## Summary: Relation Types and Their Modeling

| Relation Type | Modeling Approach                     | Example                                      |
| ------------- | ------------------------------------- | -------------------------------------------- |
| **IS-A**      | `skos:broader`/`skos:narrower`        | Width IS-A dimensional property              |
| **HAS-A**     | `skos:Collection` membership          | Substrate HAS-A {width, thickness}           |
| **PART-OF**   | External to attribute hierarchy       | Window PART-OF reactor                       |

**Key principle**: Keep the attribute vocabulary hierarchy pure by using `skos:broader`/`skos:narrower` exclusively for IS-A (taxonomic) relationships.
