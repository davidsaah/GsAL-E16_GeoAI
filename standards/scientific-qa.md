# Scientific and Geospatial QA

## Evidence checks

- Every substantive factual claim is supported by an approved source.
- Sources directly support the associated claim.
- Dates, versions, geographic scope, and limitations are current and visible.
- Primary research and official documentation are preferred.
- Disagreement among credible sources is represented honestly.
- No fabricated citations, quotations, datasets, tools, or results appear.

## Geospatial checks

- CRS and datum are identified and suitable for the analysis.
- Units are explicit and consistent.
- Spatial resolution and scale match the question and conclusions.
- Temporal coverage and revisit frequency match the claim.
- Sampling design and reference data are defensible.
- Spatial autocorrelation, leakage, and geographic transfer are addressed when relevant.
- Training, validation, and testing data are separated correctly.
- Accuracy measures are interpreted correctly, including user's and producer's accuracy when relevant.
- Maps do not imply precision or certainty beyond the underlying data.
- Independent validation occurs outside the model or agent that produced the result.

## GeoAI checks

- Model purpose, inputs, outputs, and operating assumptions are stated.
- Pretraining and transfer limitations are explained when relevant.
- Confidence is not presented as proof of correctness.
- Embeddings are not described as direct measurements of named environmental variables.
- Foundation-model outputs are locally validated before decision use.
- Generative model claims, citations, calculations, tools, and parameters are independently verified.
- Agent actions are logged and bounded by explicit permissions.

## Reproducibility checks

- Dataset provider, version, date, access date, license, and geographic coverage are recorded.
- Software, model, extension, and service versions are recorded.
- Important parameters and defaults are recorded.
- Student decisions and automated operations are distinguished.
- File names and durable output locations are documented.
- External-service fallbacks are present and tested.
