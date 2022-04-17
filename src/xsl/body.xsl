<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:book="https://github.com/xslet/2020/xslbook"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


 <!--**
  Prints book descriptions area by <body> elements.
 -->
 <xsl:template match="body" mode="xslbook">
  <!--** An URL of external data file from an ancestor element. -->
  <xsl:param name="data_url"/>
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="_id">
   <xsl:call-template name="book:get_id">
    <xsl:with-param name="data_url" select="$_data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <div class="body xslbook-body">
   <xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute>
   <xsl:apply-templates select="child::node()[name() != 'attr']">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:apply-templates>
  </div>
 </xsl:template>

</xsl:stylesheet>
