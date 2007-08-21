<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
  <page order="1">
    <meta>
      <name>Home</name>
      <file>index.html</file>
     </meta>
     <body>
       <h1>mp3unicode</h1>
       <h3>About</h3>
       <xsl:copy-of select="project/description/*"/>
       
       <h3>Latest Releases</h3>
       <p>Latest stable release: <xsl:apply-templates select="project/releases/release[@stable='true'][1]"/>.</p>
       <p>Latest development release: <xsl:apply-templates select="project/releases/release[1]"/>.</p>
       <p style="padding-left:25px">New features, bug fixes in the development release:</p>
       <ul>
         <xsl:apply-templates select="project/releases/release[1]/changes"/>
       </ul>
       <p>Packages for various distributions are also available, see <a href="downloads.html">Downloads</a>.</p>
     </body>
   </page>
</xsl:template>

<xsl:template match="release">
  <a href="{file[@type='source']}">mp3unicode-<xsl:value-of select="version"/></a>
  (<xsl:value-of select="date"/>)
</xsl:template>

<xsl:template match="change">
  <li><xsl:value-of select="."/></li>
</xsl:template>

</xsl:stylesheet>