# Coded Concepts
The following table contains a list of the coded concept fields within the eMERGE Report XML schema and their value sets. The Value Sets are recommendations not mandatory. If local, extensions or different coded concept sources are used it would require communication between the sender and receiver to agree upon those differences.

<table>
	<tr>
		<th>Coded Concept Fields</th>
		<th>Coding System Constraints</th>
	</tr>
	<tr>
		<td>Report.Genomic-Source</td>
		<td rowspan="2">Codes from LOINC answer list LL378-1 Genetic Variation Source<a href="https://r.details.loinc.org/AnswerList/LL378-1.html">https://r.details.loinc.org/AnswerList/LL378-1.html</a></td>
	</tr>
	<tr>
		<td>Report-Variant.Genomic-Source</td>
	</tr>
	<tr>
		<td>Report.Indication-Code</td>
		<td>Local codes defined by eMERGE project.</td>
	</tr>
	<tr>
		<td>Report.Overall-Interpretation</td>
		<td>Local codes defined for eMERGE project, which conceptually map to the Codes from LOINC answer list LL541-1 Genetic disease analysis overall interpretation <a href="https://r.details.loinc.org/AnswerList/LL541-4.html">https://r.details.loinc.org/AnswerList/LL541-4.html</a></td>
	</tr>
	<tr>
		<td>Report-Patient.Race-or-ethnicity</td>
		<td>Codes from CDC-NESS coding system for HL7 Table 005 Race value set maintained by the CDC at <a href="https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.6065">https://phinvads.cdc.gov/vads/ViewValueSet.action?oid=2.16.840.1.114222.4.11.6065</a>Local codes added to extend base line set.</td>
	</tr>
	<tr>
		<td>Report-Patient.Sex</td>
		<td>Codes defined by the HL7 Table 001 for Administrative Sex.<a href="https://www.hl7.org/fhir/v2/0001/index.html">https://www.hl7.org/fhir/v2/0001/index.html</a></td>
	</tr>
	<tr>
		<td>Report-Specimen.Type</td>
		<td>Local codes defined by eMERGE project.SNOMED codes may be used if configured.</td>
	</tr>
	<tr>
		<td>Report-Variant.Allele-State</td>
		<td>Codes from LOINC answer list LL381-5 Genetic variant allelic state<a href="https://r.details.loinc.org/AnswerList/LL381-5.html">https://r.details.loinc.org/AnswerList/LL381-5.html</a></td>
	</tr>
	<tr>
		<td>Report-Variant.Category</td>
		<td rowspan="2">Codes from LOINC answer list LL4034-6 Clinical significance of genetic variation<a href="https://r.details.loinc.org/AnswerList/LL4034-6.html">https://r.details.loinc.org/AnswerList/LL4034-6.html</a>Local codes may supplement or overlap and map to LOINC codes.</td>
	</tr>
	<tr>
		<td>Ref-Variant.Interpretation.Category</td>
	</tr>
	<tr>
		<td>Report.Patient-Disease.Code</td>
		<td rowspan="3">Codes from OMIM, Disease Ontology, Orphanet, and other disease codes like those defined in the Monarch Initiative merged disease ontology.Supplemental local codes defined for diseases not available or mappable to available disease coding authorities.</td>
	</tr>
	<tr>
		<td>Report.Interpreted-Disease.Code</td>
	</tr>
	<tr>
		<td>Reference-Variant.Interpretation-Disease.Code</td>
	</tr>
	<tr>
		<td>Reference-Variant.Gene-Identifier</td>
		<td rowspan="2">HGNC, Entrez-Gene, OMIM, HPRD, Ensembl source identifiers can be used for genes.</td>
	</tr>
	<tr>
		<td>Reference-Gene.Identifier</td>
	</tr>
</table>


A PDF version of this document is [also available](eMERGE-XML-Schema-Coded-Concepts.pdf)