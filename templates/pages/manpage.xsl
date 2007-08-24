<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../page.xsl"/>
<xsl:variable name="file">manpage.html</xsl:variable>

<xsl:template name="page">
  <h2>NAME</h2>
  <xsl:apply-templates select="project/manpage/body/node()[preceding-sibling::h2[text()='NAME'] and following-sibling::a[@name='index']]"/>
</xsl:template>

<xsl:template match="hr"/>

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>