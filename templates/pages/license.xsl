<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../page.xsl"/>
<xsl:variable name="file">license.html</xsl:variable>

<xsl:template name="page">
  <xsl:copy-of select="project/license"/>
</xsl:template>

</xsl:stylesheet>