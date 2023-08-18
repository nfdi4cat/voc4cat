## IRI design

We suggest to achieve permanent IRIs (URIs) by using the [w3id.org](https://w3id.org/)-service.
Their service also supports setting up [content negotiation](https://en.wikipedia.org/wiki/Content_negotiation).
For an example how to configure w3id.org for a vocabulary maintained with this template see [w3id.org/nfdi4cat/voc4cat](https://github.com/perma-id/w3id.org/tree/master/nfdi4cat/voc4cat).
There we use content navigation to serve documentation in HTML for humans and machine-readable representations like turtle for applications from the same URL.

The general IRI of the vocabulary (the SKOS-file) will have the following form:

```text
https://w3id.org/[PROJECT-ID]/[IDSPACE]/YYYY-MM-DD/[IDSPACE]
or
https://w3id.org/[PROJECT-ID]/[IDSPACE]/dev/[IDSPACE]
or
https://w3id.org/[PROJECT-ID]/[IDSPACE]
```

The most recent release is available at the root level `https://w3id.org/[PROJECT-ID]/[IDSPACE]`.
All releases including older ones are accessible under `https://w3id.org/[PROJECT-ID]/[IDSPACE]/{version}`.
Releases use the release date in iso-format as version specifier;
the version specifier may have a leading "v" which will be ignored.
For the most recent development built the version specifier "dev" is reserved.

The [PROJECT-ID] that you set up on w3id.org. For NFDI4Cat this is "nfdi4cat"
The [IDSPACE]-key for the vocabulary. The IDSPACE-key is what distinguishes one vocabulary from another. For the NFDI4Cat´s catalysis vocabulary this is "voc4cat".
The term IDSPACE is taken from [obofoundry](https://obofoundry.org/docs/Policy_for_OBO_namespace_and_associated_PURL_requests.html).

## IRIs of elements in the vocabulary

The general IRI for a concrete element is 
```text
https://w3id.org/[PROJECT-ID]/[IDSPACE]/YYYY-MM-DD/[IDSPACE]_[ID]
or
https://w3id.org/[PROJECT-ID]/[IDSPACE]/dev/[IDSPACE]_[ID]
or
https://w3id.org/[PROJECT-ID]/[IDSPACE]_[ID]
```

`[ID]` stands for the ID of the concept/collection in the vocabulary.
In voc4cat it is an integer that is left-padded with zeros to a total length of seven digits.
For example, the IRI for a concept with the ID of `123` is

`https://w3id.org/nfdi4cat/voc4cat_0000123`

## Compact IRI notation (CURIE)

The preferred CURIE notation is to use the IDRANGE as prefix. For example, the IRI 

`https://w3id.org/nfdi4cat/voc4cat_0000123`

would be written in CURIE-form as

`voc4cat:0000123`.

Here the prefix `voc4cat` stands for `https://w3id.org/nfdi4cat/voc4cat_`.

This style matches OBOs, where for example http://purl.obolibrary.org/obo/RO_0002202 is typically written as CURIE "RO:0002202", see https://obofoundry.org/id-policy.html
