<?xml version="1.0" encoding="utf-8"?>

<!--**
 This library provides XSL templates to display book titles, subtitles, and descriptions. These templates enables to display a book cover page or a top page of a Web document.

 Book titles are specified by <title> elements which are immediately below of a <book> element. In addition, the <title> elements can display book subtitles around or independently book titles.
 If you want to display subtitles around a book title, use @top-of, @left-of, @right-of, @bottom-of attributes. By specifying @id attribute value of <title> to a @top-of attribute of a <subtitle>, the <subtitle> content is displayed above of the book title. Similarly, to @left-of attribute is on left side, @right-of attribute is on right side, and @bottom-of attribute is on bottom side. This positioning does not depend on the positions at which those <subtitle> elements are written.
 <subtitle> elements without @top-of, @left-of, @right-of, or @bottom-of are displayed according to the positions at which those <subtitle> elements are written.

 Contents of <title> and <subtitle> elements immediately below a <book> element are displayed on a window title of a browser, too. As this time, the positioning by @top-of, @left-of, @right-of, or @bottom-of attribute is not applied, but their orders are applied to a window title. Hereby, it is possible that a subtitle is on the top of a title in a page but the subtitle is of the right of a title in a window title.
 Besides, it's possible not to display <subtitle> element on a window title by attaching @spine attribute of which value is 'false'.

 By uusing @prefix and/or @suffix attributes, it's possible to display texts before and/or after each <title> and <subtitle> elements. If you want to display a prefix or a suffix only in a page or only in a window title, you should use CSS. To display their prefix or suffix only in a page, use CSS pseudo-elements: ::before or ::after. To display their prefix or suffix only in a window title, use @prefix or @suffix attributes and CSS property: display:none to transformed HTML elements: <span class="prefix"> or <span class="suffix">. (Originally, @prefix and @suffix attributes are produced by reason that a prefix with ::before and a suffix with ::after cannot be displayed in a window title.)

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
