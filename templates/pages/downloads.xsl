<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../page.xsl"/>
<xsl:variable name="file">downloads.html</xsl:variable>

<xsl:template name="page">
  <h1>Downloads</h1>
  <h3>Latest Stable Release</h3>
  <xsl:apply-templates select="project/releases/release[@stable='true'][1]"/>
  
  <h3>Latest Development Release</h3>
  <xsl:apply-templates select="project/releases/release[1]"/>
</xsl:template>

<xsl:template match="release">
  mp3unicode-<xsl:value-of select="version"/> (<xsl:value-of select="date"/>)
  <ul><xsl:apply-templates select="file"/></ul>
</xsl:template>

<xsl:template match="file">
  <li>
    <a href="{.}"><xsl:apply-templates select="." mode="type"/></a>
    <xsl:apply-templates select="." mode="arch"/>
  </li>
</xsl:template>

<xsl:template match="file[@type='source']" mode="type">Source</xsl:template>
<xsl:template match="file[@type='ebuild']" mode="type">Gentoo ebuild</xsl:template>
<xsl:template match="file[@type='debian']" mode="type">Debian package</xsl:template>

<xsl:template match="file[@arch]" mode="arch"> (<xsl:value-of select="@arch"/>)</xsl:template>
<xsl:template match="*" mode="arch"/>

</xsl:stylesheet>