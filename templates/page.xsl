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
            <div style="padding-top: 15px; text-align: center; padding-right: 15px">
              <a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=203200&amp;type=1" width="88" height="31" border="0" alt="SourceForge.net Logo" /></a>
            </div>
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
  <div style="white-space: nowrap; margin-bottom: 10px">
    <a href="{file}"><xsl:value-of select="name"/></a>
    <span> $ </span>
  </div>
</xsl:template>

<xsl:template match="meta" mode="node">
  <div style="white-space: nowrap; margin-bottom: 10px">
    <a href="{file}"><xsl:value-of select="name"/></a>
    <span style="visibility: hidden"> $ </span>
  </div>
</xsl:template>

</xsl:stylesheet>
