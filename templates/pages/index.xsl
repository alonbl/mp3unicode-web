<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../page.xsl"/>
<xsl:variable name="file">index.html</xsl:variable>

<xsl:template name="page">
  <h1>mp3unicode</h1>
  <h3>About</h3>
  <xsl:copy-of select="project/description/*"/>
  
  <h3>Latest Release</h3>
  <p><xsl:apply-templates select="project/releases/release[1]"/></p>
  <p>Changes:</p>
  <ul>
    <xsl:apply-templates select="project/releases/release[1]/changes"/>
  </ul>

  <h3>Authors</h3>
  <p><xsl:apply-templates select="project/authors/author"/></p>
</xsl:template>

<xsl:template match="release">
  <a href="downloads.html">mp3unicode-<xsl:value-of select="version"/></a>
  (<xsl:value-of select="date"/>)
</xsl:template>

<xsl:template match="change">
  <li><xsl:value-of select="."/></li>
</xsl:template>

<xsl:template match="author">
  <a>
    <xsl:attribute name="href">
      <xsl:apply-templates select="*[@link]"/>
    </xsl:attribute>
    <xsl:value-of select="name"/>
  </a>
  <xsl:if test="position()!=last()">, </xsl:if>
  <xsl:if test="position()=last()">.</xsl:if>
</xsl:template>

<xsl:template match="email">mailto:<xsl:value-of select="."/></xsl:template>

</xsl:stylesheet>