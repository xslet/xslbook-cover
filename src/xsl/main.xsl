<?xml version="1.0" encoding="utf-8"?>

<!--**
 This library provides match and named templates to display book titles, subtitles, and descriptions.
 This library takes into account free positioning of them.

 This program is written in XSLT 1.0.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <!--** A set of utilities for XSLT programs on Web browsers. -->
 <xsl:import href="xslutil.xsl"/>

 <!--** XML data operation libraries for XSLT programs on Web browsers.  -->
 <xsl:import href="xsldo.xsl"/>

 <!--** XML data operation elements for xslbook. -->
 <xsl:import href="xslbook-do.xsl"/>

 <!--** xslbook base library. -->
 <xsl:import href="xslbook-base.xsl"/>

</xsl:stylesheet>
