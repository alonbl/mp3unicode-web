<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
<html>
  <head>
    <title>mp3unicode - <xsl:value-of select="document('site.xml')/pages/page[@file=$file]"/></title>
    <meta name="keywords" content="music, file, mp3, tag, id3, id3v1, id3v2, charset, encoding, convert, unicode, cp1251, koi8-r, utf8, command line"/>
  </head>
  <body>
    <table>
      <tr>
        <td valign="top">
          <div style="padding-right: 15px; padding-bottom: 100px; margin-right: 15px; border-right: 2px solid">
            <xsl:apply-templates select="document('site.xml')/pages/page"/>
            <!--<div style="text-align: center"><div style="width: 50px; height: 1px; background-color: black; margin-left: auto; margin-right: auto; margin-bottom: 10px"></div></div>-->
            <div style="margin-bottom: 10px"><a href="http://sourceforge.net/projects/mp3unicode">SF Project Page</a></div>
            <div style="padding-top: 10px; text-align: center; padding-right: 15px">
	      <a href="http://sourceforge.net/projects/mp3unicode"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=203200&amp;type=10" width="80" height="15" border="0" alt="Get mp3unicode at SourceForge.net. Fast, secure and Free Open Source software downloads" /></a>
            </div>
          </div>
        </td>
        <td valign="top">
          <xsl:call-template name="page"/>
        </td>
      </tr>
    </table>
  </body>
</html>
</xsl:template>

<xsl:template match="page">
  <xsl:apply-templates select="self::page[@file=$file]" mode="snode"/>
  <xsl:apply-templates select="self::page[@file!=$file]" mode="node"/>
</xsl:template>

<xsl:template match="page" mode="snode">
  <div style="white-space: nowrap; margin-bottom: 10px">
    <a href="{@file}"><xsl:value-of select="."/></a>
    <span> $ </span>
  </div>
</xsl:template>

<xsl:template match="page" mode="node">
  <div style="white-space: nowrap; margin-bottom: 10px">
    <a href="{@file}"><xsl:value-of select="."/></a>
    <span style="visibility: hidden"> $ </span>
  </div>
</xsl:template>

</xsl:stylesheet>
