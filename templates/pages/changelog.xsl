<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../page.xsl"/>
<xsl:variable name="file">changelog.html</xsl:variable>

<xsl:template name="page">
  <h1>ChangeLog</h1>
  <xsl:apply-templates select="project/releases"/>
</xsl:template>

<xsl:template match="release">
  <p style="margin-bottom: 4px"><xsl:value-of select="date"/> -- Version <xsl:value-of select="version"/></p>
  <ul style="margin-top: 0px"><xsl:apply-templates select="changes"/></ul>
</xsl:template>

<xsl:template match="change">
  <li><xsl:value-of select="."/></li>
</xsl:template>

</xsl:stylesheet>