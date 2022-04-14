<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:book="https://github.com/xslet/2020/xslbook"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


 <!--**
  Makes a window title from <title> and <subtitle> element.
  This template prints contents of <title> and <subtitle> elements in the order of the appearance in a xslbook document.
  If <subtitle> element has @spine attribute of which the value is "false", the element is hidden on a window title.
 -->
 <xsl:template name="book:get_window_title">
  <!--** An URL of external data file from an ancestor element. -->
  <xsl:param name="data_url"/>
  <xsl:variable name="_title">
   <xsl:for-each select="title|subtitle[not(@spine='false')]">
    <xsl:value-of select="' '"/>
    <xsl:call-template name="book:_get_book_title_label">
     <xsl:with-param name="data_url" select="$data_url"/>
    </xsl:call-template>
   </xsl:for-each>
  </xsl:variable>
  <xsl:value-of select="substring($_title, 2)"/>
 </xsl:template>

 <xsl:template name="book:_get_book_title_label">
  <xsl:param name="data_url"/>
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:call-template name="book:get_attr">
   <xsl:with-param name="name">prefix</xsl:with-param>
   <xsl:with-param name="data_url" select="$_data_url"/>
  </xsl:call-template>
  <xsl:apply-templates>
   <xsl:with-param name="data_url" select="$_data_url"/>
  </xsl:apply-templates>
  <xsl:call-template name="book:get_attr">
   <xsl:with-param name="name">suffix</xsl:with-param>
   <xsl:with-param name="data_url" select="$_data_url"/>
  </xsl:call-template>
 </xsl:template>

</xsl:stylesheet>
