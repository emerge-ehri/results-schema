<?xml version="1.0"?>
<!--
  Stylesheet used within the eMERGE network (https://emerge.mc.vanderbilt.edu/) for the return of structured sequencing results.

  This work as part of the eMERGE Network was initiated and funded by the NHGRI through the following grants: U01HG8657 (Group Health Cooperative/University of Washington); U01HG8685 (Brigham and Women's Hospital); U01HG8672 (Vanderbilt University Medical Center); U01HG8666 (Cincinnati Children's Hospital Medical Center); U01HG6379 (Mayo Clinic); U01HG8679 (Geisinger Clinic); U01HG8680 (Columbia University Health Sciences); U01HG8684 (Children's Hospital of Philadelphia); U01HG8673 (Northwestern University); U01HG8701 (Vanderbilt University Medical Center serving as the Coordinating Center); U01HG8676 (Partners Healthcare/Broad Institute); and U01HG8664 (Baylor College of Medicine).
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <style>
          * {
            margin: 0;
            padding: 0;
          }
          body {
            font-family: Arial;
            font-size: 10pt;
            margin: 10px;
          }
          h1 {
            font-size: 2em;
          }
          h2 {
            font-size: 1.8em;
            padding-top: 15px;
          }
          h3 {
            font-size: 1.5em;
            padding-top: 5px;
          }
          td {
            padding-right: 15px;
            vertical-align: top;
            white-space: nowrap;
          }
          .code {
            font-style: italic;
            color: #444;
          }
          a:link, a:visited, a:hover {
            color: #00F;
          }

          a .code {
            color: #00F;
          }
          .variantTable {
            padding-bottom: 10px;
          }
          span.infobutton {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image:url(data:image/jpeg;base64,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);
          }
        </style>
      </head>
      <body>
        <h1>eMERGE-Seq Lab Result</h1>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="origin/org.pcpgm.gis.fedmsg.v4.EnvelopeSender">
    <h2>Sender</h2>
    <table>
      <tr>
        <td>Sender ID</td>
        <td><xsl:value-of select="senderId"/></td>
      </tr>
      <tr>
        <td>Timestamp (ms)</td>
        <td><xsl:value-of select="timestampMs"/></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="objMessage">
    <h2>Message</h2>
    <xsl:apply-templates select="report"/>
    <xsl:apply-templates select="refVariants"/>
    <xsl:apply-templates select="refAssayVersions"/>
  </xsl:template>

  <xsl:template match="report">
    <h3>Report</h3>
    <table>
      <tr>
        <td>Report Identifier</td>
        <td><xsl:value-of select="reportIdentifier"/></td>
      </tr>
      <xsl:if test="vipFile">
        <tr>
          <td>VIP File</td>
          <td><xsl:value-of select="vipFile"/></td>
        </tr>
      </xsl:if>
      <xsl:if test="geneCoverage">
        <tr>
          <td>Gene Coverage</td>
          <td>
            <xsl:apply-templates select="geneCoverage"/>
          </td>
        </tr>
      </xsl:if>
      <tr>
        <td>Addendums</td>
        <td>
          TODO
        </td>
      </tr>
      <tr>
        <td>Indication Text</td>
        <td><xsl:value-of select="indicationText"/></td>
      </tr>
      <tr>
        <td>Genomic Source</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="genomicSource/code"/>
            <xsl:with-param name="codeText" select="genomicSource/codeText"/>
            <xsl:with-param name="codeSystem" select="genomicSource/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="genomicSource/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Overall Interpretation</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="overallInterpretation/code"/>
            <xsl:with-param name="codeText" select="overallInterpretation/codeText"/>
            <xsl:with-param name="codeSystem" select="overallInterpretation/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="overallInterpretation/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Test Type</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="testType/code"/>
            <xsl:with-param name="codeText" select="testType/codeText"/>
            <xsl:with-param name="codeSystem" select="testType/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="testType/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Status</td>
        <td><xsl:value-of select="status"/></td>
      </tr>
      <tr>
        <td>Case Type</td>
        <td><xsl:value-of select="caseType"/></td>
      </tr>
      <tr>
        <td>Lab Status</td>
        <td><xsl:value-of select="labStatus"/></td>
      </tr>
      <tr>
        <td>Edited By</td>
        <td>
          <xsl:call-template name="nameDate">
            <xsl:with-param name="byName" select="editedBy/byName"/>
            <xsl:with-param name="onDate" select="editedBy/onDate"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Status By</td>
        <td>
          <xsl:call-template name="nameDate">
            <xsl:with-param name="byName" select="statusBy/byName"/>
            <xsl:with-param name="onDate" select="statusBy/onDate"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Order</td>
        <td>
          <xsl:apply-templates select="order" />
        </td>
      </tr>
      <tr>
        <td>Patient</td>
        <td>
          <xsl:apply-templates select="patient" />
        </td>
      </tr>
      <tr>
        <td>Physician(s)</td>
        <td>
          <xsl:apply-templates select="physicians" />
        </td>
      </tr>
      <tr>
        <td>Report Variant(s)</td>
        <td>
          <xsl:apply-templates select="reportVariants" />
        </td>
      </tr>
      <tr>
        <td>Report Assay</td>
        <td><xsl:apply-templates select="reportAssays"/></td>
      </tr>
      <tr>
        <td>Specimens</td>
        <td><xsl:apply-templates select="specimens"/></td>
      </tr>
      <tr>
        <td>Patient Diseases</td>
        <td><xsl:apply-templates select="patientDiseases" /></td>
      </tr>
      <tr>
        <td>Interpreted Diseases</td>
        <td><xsl:apply-templates select="interpretedDiseases" /></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="refVariants">
    <h3>Reference Variants</h3>
    <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.ReferenceVariant"/>
  </xsl:template>

  <xsl:template match="refAssayVersions">
    <h3>Reference Assay</h3>
  </xsl:template>

  <xsl:template match="geneCoverage">
    <table>
      <xsl:for-each select="genes/gene">
        <tr>
          <td><xsl:value-of select="name"/></td>
          <td><xsl:value-of select="coverage"/>%</td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template match="order">
    <table>
      <tr>
        <td>Order Date</td>
        <td><xsl:value-of select="orderDate" /></td>
      </tr>
      <tr>
        <td>Sender Patient Number</td>
        <td><xsl:value-of select="senderPatientNumber" /></td>
      </tr>
      <tr>
        <td>Sender Facility Name</td>
        <td><xsl:value-of select="senderFacilityName" /></td>
      </tr>
      <tr>
        <td>Sender Order Number</td>
        <td><xsl:value-of select="senderOrderNumber" /></td>
      </tr>
      <tr>
        <td>Sender Lab Control Number</td>
        <td><xsl:value-of select="senderLabControlNumber" /></td>
      </tr>
      <tr>
        <td>Local Order Number</td>
        <td><xsl:value-of select="localOrderNumber" /></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="patient">
    <table>
      <tr>
        <td>Name</td>
        <td>
          <xsl:value-of select="firstName" />
          <xsl:if test="middleName != ''">
            <xsl:text> </xsl:text>
            <xsl:value-of select="middleName" />
          </xsl:if>
          <xsl:text> </xsl:text>
          <xsl:value-of select="lastName" />
        </td>
      </tr>
      <tr>
        <td>DOB</td>
        <td><xsl:value-of select="dateOfBirth"/></td>
      </tr>
      <tr>
        <td>Race/Ethnicity</td>
        <td>
          <xsl:for-each select="raceOrEthnicity/org.pcpgm.gis.fedmsg.v4.Code">
            <xsl:call-template name="codeValue">
              <xsl:with-param name="code" select="./code"/>
              <xsl:with-param name="codeText" select="./codeText"/>
              <xsl:with-param name="codeSystem" select="./codeSystem"/>
              <xsl:with-param name="valueSetAbbr" select="./valueSetAbbr"/>
            </xsl:call-template>
            <br/>
          </xsl:for-each>
        </td>
      </tr>
      <tr>
        <td>Sex</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="sex/code"/>
            <xsl:with-param name="codeText" select="sex/codeText"/>
            <xsl:with-param name="codeSystem" select="sex/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="sex/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="physicians">
    <table>
      <xsl:for-each select="org.pcpgm.gis.fedmsg.v4.Physician">
        <tr>
          <td>
            <xsl:value-of select="firstName" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="lastName" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template match="reportVariants">
    <xsl:if test="count(*) = 0">
      Negative: No pathogenic or likely pathogenic variants detected
    </xsl:if>
    <xsl:if test="count(*) &gt; 0">
      <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.ReportVariant"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.ReportVariant">
    <table class="variantTable">
      <tr>
        <td>External ID</td>
        <td>
          <a>
            <xsl:attribute name="href">
              #<xsl:value-of select="externalId"/>
            </xsl:attribute>
            <xsl:value-of select="externalId"/>
          </a>
        </td>
      </tr>
      <tr>
        <td>Transcript ID</td>
        <td><xsl:value-of select="transcriptId"/></td>
      </tr>
      <tr>
        <td>DNA Change</td>
        <td><xsl:value-of select="dnaChange"/></td>
      </tr>
      <tr>
        <td>Amino Acid Change</td>
        <td><xsl:value-of select="aminoAcidChange"/></td>
      </tr>
      <tr>
        <td>Chromosome</td>
        <td><xsl:value-of select="chromosome"/></td>
      </tr>
      <tr>
        <td>Gene Symbol</td>
        <td><xsl:value-of select="geneSymbol"/></td>
      </tr>
      <tr>
        <td>Significant</td>
        <td><xsl:value-of select="significant"/></td>
      </tr>
      <tr>
        <td>Interrogated But Not Found</td>
        <td><xsl:value-of select="interrogatedButNotFound"/></td>
      </tr>
      <tr>
        <td>Not Interpreted</td>
        <td><xsl:value-of select="notInterpreted"/></td>
      </tr>
      <xsl:if test="notes">
        <tr>
          <td>Notes</td>
          <td><xsl:value-of select="notes"/></td>
        </tr>
      </xsl:if>
      <tr>
        <td>Allele State</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="alleleState/code"/>
            <xsl:with-param name="codeText" select="alleleState/codeText"/>
            <xsl:with-param name="codeSystem" select="alleleState/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="alleleState/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Category Type</td>
        <td><xsl:value-of select="categoryType"/></td>
      </tr>
      <tr>
        <td>Category</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="category/code"/>
            <xsl:with-param name="codeText" select="category/codeText"/>
            <xsl:with-param name="codeSystem" select="category/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="category/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Genomic Source</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="genomicSource/code"/>
            <xsl:with-param name="codeText" select="genomicSource/codeText"/>
            <xsl:with-param name="codeSystem" select="genomicSource/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="genomicSource/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Confirmed Status</td>
        <td><xsl:value-of select="confirmedStatus/confirmedBySanger"/></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.ReferenceVariant">
    <table class="variantTable">
      <tr>
        <td>External ID</td>
        <td>
          <a>
            <xsl:attribute name="name">
              <xsl:value-of select="externalId"/>
            </xsl:attribute>
            <xsl:value-of select="externalId"/>
          </a>
        </td>
      </tr>
      <tr>
        <td>Transcript ID</td>
        <td><xsl:value-of select="transcriptId"/></td>
      </tr>
      <tr>
        <td>DNA Change</td>
        <td><xsl:value-of select="dnaChange"/></td>
      </tr>
      <tr>
        <td>Amino Acid Change</td>
        <td><xsl:value-of select="aminoAcidChange"/></td>
      </tr>
      <tr>
        <td>Chromosome</td>
        <td><xsl:value-of select="chromosome"/></td>
      </tr>
      <tr>
        <td>Report DNA Change</td>
        <td><xsl:value-of select="reportDnaChange"/></td>
      </tr>
      <tr>
        <td>Gene Identifier</td>
        <td>
          <a>
            <xsl:attribute name="href">
              https://search.clinicalgenome.org/kb/home?term=<xsl:value-of select="geneIdentifier/code"/>
            </xsl:attribute>
            <xsl:apply-templates select="geneIdentifier" />
            <span class="infobutton"/>
          </a>
        </td>
      </tr>
      <tr>
        <td>Alignment(s)</td>
        <td>
          <xsl:apply-templates select="alignments" />
        </td>
      </tr>
      <tr>
        <td>Current Interpretation</td>
        <td><xsl:apply-templates select="currentInterpRevision" /></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="reportAssays">
    <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.ReportAssay"/>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.ReportAssay">
    <table>
      <tr>
        <td>Assay Version External ID</td>
        <td><xsl:value-of select="assayVersionExternalId" /></td>
      </tr>
      <tr>
        <td>Test Name</td>
        <td><xsl:value-of select="testName" /></td>
      </tr>
      <tr>
        <td>Test Code</td>
        <td><xsl:value-of select="testCode" /></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="specimens">
    <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.Specimen"/>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.Specimen">
    <table>
      <tr>
        <td>Label</td>
        <td><xsl:value-of select="label" /></td>
      </tr>
      <tr>
        <td>Type</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="type/code"/>
            <xsl:with-param name="codeText" select="type/codeText"/>
            <xsl:with-param name="codeSystem" select="type/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="type/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Collection Date</td>
        <td><xsl:value-of select="collectionDate" /></td>
      </tr>
      <tr>
        <td>Received Date</td>
        <td><xsl:value-of select="receivedDate" /></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="patientDiseases|interpretedDiseases">
    <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.ReportDisease"/>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.ReportDisease">
    <table>
      <tr>
        <td>Name</td>
        <td><xsl:value-of select="name" /></td>
      </tr>
      <tr>
        <td>Disease Code</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="diseaseCode/code"/>
            <xsl:with-param name="codeText" select="diseaseCode/codeText"/>
            <xsl:with-param name="codeSystem" select="diseaseCode/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="diseaseCode/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="geneIdentifier">
    <xsl:value-of select="codeText"/>
    <span class="code">
      (<xsl:value-of select="codeSystem" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="code"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="authority"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="authorityName"/>)
    </span>
  </xsl:template>

  <xsl:template match="alignments">
    <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.ReferenceVariantAlignment"/>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.ReferenceVariantAlignment">
    <table>
      <tr>
        <td>Genome Build Name</td>
        <td><xsl:value-of select="genomeBuildName" /></td>
      </tr>
      <tr>
        <td>Chromosome</td>
        <td><xsl:value-of select="chromosome" /></td>
      </tr>
      <tr>
        <td>Start Position</td>
        <td><xsl:value-of select="startPosition" /></td>
      </tr>
      <tr>
        <td>End Position</td>
        <td><xsl:value-of select="endPosition" /></td>
      </tr>
      <tr>
        <td>Wildtype Sequence</td>
        <td><xsl:value-of select="wildtypeSeq" /></td>
      </tr>
      <tr>
        <td>Variant Sequence</td>
        <td><xsl:value-of select="variantSeq" /></td>
      </tr>
    </table>
  </xsl:template>


  <xsl:template match="currentInterpRevision">
    <table>
      <tr>
        <td>Variant External ID</td>
        <td><xsl:value-of select="variantExternalId" /></td>
      </tr>
      <tr>
        <td>Content Approval</td>
        <td>
          <xsl:call-template name="nameDate">
            <xsl:with-param name="byName" select="contentApproval/byName"/>
            <xsl:with-param name="onDate" select="contentApproval/onDate"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Approval</td>
        <td>
          <xsl:call-template name="nameDate">
            <xsl:with-param name="byName" select="approval/byName"/>
            <xsl:with-param name="onDate" select="approval/onDate"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Interpretations</td>
        <td><xsl:apply-templates select="interpretations"/></td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="interpretations">
    <xsl:apply-templates select="org.pcpgm.gis.fedmsg.v4.VariantInterp"/>
  </xsl:template>

  <xsl:template match="org.pcpgm.gis.fedmsg.v4.VariantInterp">
    <table>
      <tr>
        <td>Category Type</td>
        <td><xsl:value-of select="categoryType" /></td>
      </tr>
      <tr>
        <td>Category Code</td>
        <td>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="categoryCode/code"/>
            <xsl:with-param name="codeText" select="categoryCode/codeText"/>
            <xsl:with-param name="codeSystem" select="categoryCode/codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="categoryCode/valueSetAbbr"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td>Inheritance</td>
        <td><xsl:value-of select="inheritance" /></td>
      </tr>
      <tr>
        <td>Interpretation Text</td>
        <td><xsl:value-of select="interpretationText" /></td>
      </tr>
      <tr>
        <td>Disease Codes</td>
        <td>
          <xsl:apply-templates select="diseaseCodes"/>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="diseaseCodes">
    <xsl:for-each select="org.pcpgm.gis.fedmsg.v4.Code">
      <xsl:if test="./codeSystem = 'MIM'">
        <a>
          <xsl:attribute name="href">
            https://search.clinicalgenome.org/kb/conditions/OMIM_<xsl:value-of select="./code"/>
          </xsl:attribute>
          <xsl:call-template name="codeValue">
            <xsl:with-param name="code" select="./code"/>
            <xsl:with-param name="codeText" select="./codeText"/>
            <xsl:with-param name="codeSystem" select="./codeSystem"/>
            <xsl:with-param name="valueSetAbbr" select="./valueSetAbbr"/>
          </xsl:call-template>
          <span class="infobutton" />
        </a>
      </xsl:if>
      <xsl:if test="./codeSystem != 'MIM'">
        <xsl:call-template name="codeValue">
          <xsl:with-param name="code" select="./code"/>
          <xsl:with-param name="codeText" select="./codeText"/>
          <xsl:with-param name="codeSystem" select="./codeSystem"/>
          <xsl:with-param name="valueSetAbbr" select="./valueSetAbbr"/>
        </xsl:call-template>
      </xsl:if>
      <br/>
    </xsl:for-each>
  </xsl:template>

  <!-- Special template to handle elements that represent a coded value from a code system -->
  <xsl:template name="codeValue">
    <xsl:param name="code"/>
    <xsl:param name="codeText"/>
    <xsl:param name="codeSystem"/>
    <xsl:param name="valueSetAbbr"/>
    <xsl:value-of select="$codeText"/>
    <span class="code">
      (<xsl:value-of select="$codeSystem" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="$code"/>
      <xsl:if test="$valueSetAbbr != $codeText">
        <xsl:text>, </xsl:text>
        <xsl:value-of select="$valueSetAbbr"/>
      </xsl:if>
      )
    </span>
  </xsl:template>

  <!-- Special template to handle elements that contain byName and onDate elements -->
  <xsl:template name="nameDate">
    <xsl:param name="byName"/>
    <xsl:param name="onDate"/>
    <xsl:value-of select="$byName"/>
    (<xsl:value-of select="$onDate"/>)
  </xsl:template>

</xsl:stylesheet>