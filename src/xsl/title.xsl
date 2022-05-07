<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
 xmlns:book="https://github.com/xslet/2020/xslbook"
 xmlns:do="https://github.com/xslet/2020/xsldo"
 xmlns:ut="https://github.com/xslet/2020/xslutil"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


 <!--**
  This match template is applied to <title> element immediately below the root <xslbook> element and displays a book title. In addition, this template displays subtitles around a book title by <subtitle> elements with @top-of, @left-of, @right-of, or @bottom-of attributes.
  The @mode attribute of this XSLT template is "xslbook".
  This match template can have child elements, including elements provided by xslbook-do library. And this template can have @data-src attribute to obtain data in an external XML file.
 -->
 <xsl:template match="title" mode="xslbook">
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
  <h1 class="title xslbook-title">
   <xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute>
   <xsl:for-each select="../subtitle[@top-of=$_id]">
    <div class="subtitle xslbook-subtitle top-of-title">
     <xsl:attribute name="id">
      <xsl:call-template name="book:get_id">
       <xsl:with-param name="data_url" select="$_data_url"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:call-template name="book:_get_book_title_text_updating_data_url">
      <xsl:with-param name="data_url" select="$data_url"/>
     </xsl:call-template>
    </div>
   </xsl:for-each>
   <xsl:for-each select="../subtitle[@left-of=$_id]">
    <span class="subtitle xslbook-subtitle left-of-title">
     <xsl:attribute name="id">
      <xsl:call-template name="book:get_id">
       <xsl:with-param name="data_url" select="$_data_url"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:call-template name="book:_get_book_title_text_updating_data_url">
      <xsl:with-param name="data_url" select="$data_url"/>
     </xsl:call-template>
    </span>
    <xsl:value-of select="' '"/>
   </xsl:for-each>
   <xsl:call-template name="book:_get_book_title_text">
    <xsl:with-param name="data_url" select="$_data_url"/>
   </xsl:call-template>
   <xsl:for-each select="../subtitle[@right-of=$_id]">
    <xsl:value-of select="' '"/>
    <span class="subtitle xslbook-subtitle right-of-title">
     <xsl:attribute name="id">
      <xsl:call-template name="book:get_id">
       <xsl:with-param name="data_url" select="$_data_url"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:call-template name="book:_get_book_title_text_updating_data_url">
      <xsl:with-param name="data_url" select="$data_url"/>
     </xsl:call-template>
    </span>
   </xsl:for-each>
   <xsl:for-each select="../subtitle[@bottom-of=$_id]">
    <div class="subtitle xslbook-subtitle bottom-of-title">
     <xsl:attribute name="id">
      <xsl:call-template name="book:get_id">
       <xsl:with-param name="data_url" select="$_data_url"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:call-template name="book:_get_book_title_text_updating_data_url">
      <xsl:with-param name="data_url" select="$data_url"/>
     </xsl:call-template>
    </div>
   </xsl:for-each>
  </h1>
 </xsl:template>


 <!--**
  This match template is applied to <subtitle> element without @top-of, @left-of, @right-of, and @bottom-of attributes and displays a book subtitle.
  This @mode attribute of this XSLT template is "xslbook".
  This match template can have child elements, including elements provided by xslbook-do library. And this template can have @data-src attribute to obtain data in an external XML file.
 -->
 <xsl:template match="subtitle[not(@top-of or @left-of or @right-of or @bottom-of)]" mode="xslbook">
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
  <div class="subtitle xslbook-subtitle">
   <xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute>
   <xsl:call-template name="book:_get_book_title_text">
    <xsl:with-param name="data_url" select="$_data_url"/>
   </xsl:call-template>
  </div>
 </xsl:template>


 <xsl:template name="book:_get_book_title_text">
  <xsl:param name="data_url"/>
  <xsl:variable name="_prefix">
   <xsl:call-template name="book:get_attr">
    <xsl:with-param name="name">prefix</xsl:with-param>
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="_suffix">
   <xsl:call-template name="book:get_attr">
    <xsl:with-param name="name">suffix</xsl:with-param>
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:if test="string-length($_prefix) != 0">
   <span class="prefix"><xsl:value-of select="$_prefix"/></span>
  </xsl:if>
  <xsl:apply-templates select="child::node()[name() != 'attr']">
   <xsl:with-param name="data_url" select="$data_url"/>
  </xsl:apply-templates>
  <xsl:if test="string-length($_suffix) != 0">
   <span class="suffix"><xsl:value-of select="$_suffix"/></span>
  </xsl:if>
 </xsl:template>

 <xsl:template name="book:_get_book_title_text_updating_data_url">
  <xsl:param name="data_url"/>
  <xsl:variable name="_data_url">
   <xsl:call-template name="book:get_data_url">
    <xsl:with-param name="data_url" select="$data_url"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:call-template name="book:_get_book_title_text">
   <xsl:with-param name="data_url" select="$_data_url"/>
  </xsl:call-template>
 </xsl:template>

</xsl:stylesheet>
