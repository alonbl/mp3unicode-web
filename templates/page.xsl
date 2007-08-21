<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
<html>
  <head>
    <title>mp3unicode -- <xsl:value-of select="pages/page[meta/file=$file]/meta/name"/></title>
    <meta name="keywords" content="music, file, mp3, tag, id3, id3v1, id3v2, charset, encoding, convert, unicode, cp1251, koi8-r, utf8, command line"/>
  </head>
  <body>
    <table>
      <tr>
        <td valign="top">
          <div style="padding-right: 15px; padding-bottom: 100px; margin-right: 15px; border-right: 2px solid">
            <xsl:apply-templates select="pages/page">
              <xsl:sort select="@order"/>
            </xsl:apply-templates>
          </div>
        </td>
        <td valign="top">
          <xsl:copy-of select="pages/page[meta/file=$file]/body/node()"/>
        </td>
      </tr>
    </table>
  </body>
</html>
</xsl:template>

<xsl:template match="page">
  <xsl:apply-templates select="meta[file=$file]" mode="snode"/>
  <xsl:apply-templates select="meta[file!=$file]" mode="node"/>
</xsl:template>

<xsl:template match="meta" mode="snode">
  <p style="white-space: nowrap">
    <a href="{file}"><xsl:value-of select="name"/></a>
    <span> $ </span>
  </p>
</xsl:template>

<xsl:template match="meta" mode="node">
  <p style="white-space: nowrap">
    <a href="{file}"><xsl:value-of select="name"/></a>
    <span style="visibility: hidden"> $ </span>
  </p>
</xsl:template>
  
<!--<xsl:template match="page">
  <p>
    <a href="{meta/file}"><xsl:value-of select="meta/name"/></a>
    <xsl:apply-templates select="meta[file=$file]"/>
  </p>
</xsl:template>

<xsl:template match="meta"> $ </xsl:template>-->

</xsl:stylesheet>
