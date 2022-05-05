<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:book="https://github.com/xslet/2020/xslbook" xmlns:do="https://github.com/xslet/2020/xsldo" xmlns:ut="https://github.com/xslet/2020/xslutil" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:import href="xslutil.xsl"/><xsl:import href="xsldo.xsl"/><xsl:import href="xslbook-do.xsl"/><xsl:import href="xslbook-base.xsl"/><xsl:strip-space elements="*"/><xsl:template match="title" mode="xslbook"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:call-template name="book:get_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></xsl:variable><xsl:variable name="_id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:variable><h1 class="title xslbook-title"><xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute><xsl:for-each select="../subtitle[@top-of=$_id]"><div class="subtitle xslbook-subtitle top-of-title"><xsl:attribute name="id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:attribute><xsl:call-template name="book:_get_book_title_text_updating_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></div></xsl:for-each><xsl:for-each select="../subtitle[@left-of=$_id]"><span class="subtitle xslbook-subtitle left-of-title"><xsl:attribute name="id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:attribute><xsl:call-template name="book:_get_book_title_text_updating_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></span><xsl:value-of select="' '"/></xsl:for-each><xsl:call-template name="book:_get_book_title_text"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template><xsl:for-each select="../subtitle[@right-of=$_id]"><xsl:value-of select="' '"/><span class="subtitle xslbook-subtitle right-of-title"><xsl:attribute name="id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:attribute><xsl:call-template name="book:_get_book_title_text_updating_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></span></xsl:for-each><xsl:for-each select="../subtitle[@bottom-of=$_id]"><div class="subtitle xslbook-subtitle bottom-of-title"><xsl:attribute name="id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:attribute><xsl:call-template name="book:_get_book_title_text_updating_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></div></xsl:for-each></h1></xsl:template><xsl:template match="subtitle[not(@top-of or @left-of or @right-of or @bottom-of)]" mode="xslbook"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:call-template name="book:get_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></xsl:variable><xsl:variable name="_id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:variable><div class="subtitle xslbook-subtitle"><xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute><xsl:call-template name="book:_get_book_title_text"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></div></xsl:template><xsl:template name="book:_get_book_title_text"><xsl:param name="data_url"/><span class="prefix"><xsl:call-template name="book:get_attr"><xsl:with-param name="name">prefix</xsl:with-param><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></span><xsl:apply-templates select="child::node()[name() != 'attr']"><xsl:with-param name="data_url" select="$data_url"/></xsl:apply-templates><span class="suffix"><xsl:call-template name="book:get_attr"><xsl:with-param name="name">suffix</xsl:with-param><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></span></xsl:template><xsl:template match="compute[@name='book:_get_book_title_text']"><xsl:call-template name="book:_get_book_title_text"><xsl:with-param name="data_url"><xsl:value-of select="param[@name='data_url']"/></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="book:_get_book_title_text_updating_data_url"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:call-template name="book:get_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></xsl:variable><xsl:call-template name="book:_get_book_title_text"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:template><xsl:template match="compute[@name='book:_get_book_title_text_updating_data_url']"><xsl:call-template name="book:_get_book_title_text_updating_data_url"><xsl:with-param name="data_url"><xsl:value-of select="param[@name='data_url']"/></xsl:with-param></xsl:call-template></xsl:template><xsl:template match="body" mode="xslbook"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:call-template name="book:get_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></xsl:variable><xsl:variable name="_id"><xsl:call-template name="book:get_id"><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:variable><div class="body xslbook-body"><xsl:attribute name="id"><xsl:value-of select="$_id"/></xsl:attribute><xsl:apply-templates select="child::node()[name() != 'attr']"><xsl:with-param name="data_url" select="$data_url"/></xsl:apply-templates></div></xsl:template><xsl:template name="book:get_window_title"><xsl:param name="data_url"/><xsl:variable name="_title"><xsl:for-each select="title|subtitle[not(@spine='false')]"><xsl:value-of select="' '"/><xsl:call-template name="book:_get_book_title_label"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></xsl:for-each></xsl:variable><xsl:value-of select="substring($_title, 2)"/></xsl:template><xsl:template match="compute[@name='book:get_window_title']"><xsl:call-template name="book:get_window_title"><xsl:with-param name="data_url"><xsl:value-of select="param[@name='data_url']"/></xsl:with-param></xsl:call-template></xsl:template><xsl:template name="book:_get_book_title_label"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:call-template name="book:get_data_url"><xsl:with-param name="data_url" select="$data_url"/></xsl:call-template></xsl:variable><xsl:call-template name="book:get_attr"><xsl:with-param name="name">prefix</xsl:with-param><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template><xsl:apply-templates><xsl:with-param name="data_url" select="$_data_url"/></xsl:apply-templates><xsl:call-template name="book:get_attr"><xsl:with-param name="name">suffix</xsl:with-param><xsl:with-param name="data_url" select="$_data_url"/></xsl:call-template></xsl:template><xsl:template match="compute[@name='book:_get_book_title_label']"><xsl:call-template name="book:_get_book_title_label"><xsl:with-param name="data_url"><xsl:value-of select="param[@name='data_url']"/></xsl:with-param></xsl:call-template></xsl:template><xsl:template match="/*"><xsl:variable name="_data_url" select="@data-src"/><html><head><meta charset="utf-8"/><title><xsl:value-of select="@title"/></title><link rel="stylesheet" href="./unit-test.css"/><script src="./unit-test.js"/></head><body><div id="passFailBar"/><h1><xsl:value-of select="@title"/></h1><xsl:apply-templates select="describe|it"><xsl:with-param name="data_url" select="$_data_url"/></xsl:apply-templates></body></html></xsl:template><xsl:template match="describe"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:choose><xsl:when test="boolean(@data-src)"><xsl:value-of select="@data-src"/></xsl:when><xsl:otherwise><xsl:value-of select="$data_url"/></xsl:otherwise></xsl:choose></xsl:variable><section class="describe"><div class="title"><xsl:value-of select="@title"/></div><xsl:apply-templates select="describe|it"><xsl:with-param name="data_url" select="$_data_url"/></xsl:apply-templates></section></xsl:template><xsl:template match="it"><xsl:param name="data_url"/><xsl:variable name="_data_url"><xsl:choose><xsl:when test="boolean(@data-src)"><xsl:value-of select="@data-src"/></xsl:when><xsl:otherwise><xsl:value-of select="$data_url"/></xsl:otherwise></xsl:choose></xsl:variable><section><xsl:choose><xsl:when test="@skip='true'"><xsl:attribute name="class">it skip</xsl:attribute><div class="title"><xsl:value-of select="@title"/></div></xsl:when><xsl:otherwise><xsl:variable name="_computed"><xsl:apply-templates select="compute"><xsl:with-param name="data_url" select="$_data_url"/></xsl:apply-templates></xsl:variable><xsl:variable name="_expected"><xsl:apply-templates select="expect"/></xsl:variable><xsl:choose><xsl:when test="$_computed = $_expected"><xsl:attribute name="class">it pass</xsl:attribute><xsl:call-template name="it-content"><xsl:with-param name="expected" select="$_expected"/><xsl:with-param name="computed" select="$_computed"/></xsl:call-template></xsl:when><xsl:otherwise><xsl:attribute name="class">it fail</xsl:attribute><xsl:call-template name="it-content"><xsl:with-param name="expected" select="$_expected"/><xsl:with-param name="computed" select="$_computed"/></xsl:call-template></xsl:otherwise></xsl:choose></xsl:otherwise></xsl:choose></section></xsl:template><xsl:template name="it-content"><xsl:param name="computed"/><xsl:param name="expected"/><div class="title"><xsl:value-of select="@title"/><a class="to-show" href="javascript:void(0)" onclick="showHideComparison(this);"/></div><div class="comparison hide"><div class="legends"><span class="expected">:Expected, </span><span class="computed">:Computed</span></div><div class="code expected"><xsl:value-of select="$expected"/></div><div class="code computed"><xsl:value-of select="$computed"/></div></div></xsl:template><xsl:template match="compute/param"/></xsl:stylesheet>