<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select=".//titleStmt/title"/>
                </title>
            </head>
            <body>
                <!-- Add a title -->
                <h1><xsl:value-of select="//titleStmt/title"/></h1>
                <h2><xsl:value-of select="//titleStmt/author"/></h2>
                
                <h3>Notice</h3>
                <!-- display here information about the manuscript -->
                <xsl:apply-templates select="descendant::msDesc"/>
                
                <!-- display an index her -->
                <h2>Index</h2>
                <ul class="index">
                    <xsl:apply-templates select="//listPerson"/>
                </ul>
                
                <!-- Add here the text -->
                <h2>text</h2>
                <div class="text">
                    <xsl:apply-templates select="//body"/>
                </div>
                
            </body>
        </html>
    </xsl:template>
    
    <!-- organised information about manuscript -->
      
    <xsl:template match="msIdentifier">
        <p><i><xsl:value-of select="concat(country,', ', settlement, ', ', idno)"/></i></p>
    </xsl:template>
    <xsl:template match="head"/>
    <xsl:template match="msContents">
        <h4>Content</h4>
        <ul><xsl:apply-templates/></ul>
    </xsl:template>
    <xsl:template match="msItemStruct">
        <li><xsl:value-of select="concat('f.', locus/@from, '-', locus/@to)"/><br/>
            <xsl:text>Title : </xsl:text><i><xsl:value-of select="title"/></i><br/>
            <xsl:text>Author : </xsl:text><xsl:value-of select="author"/>
        </li>
    </xsl:template>
    <xsl:template match="physDesc">
        <h4>Description</h4>
        <p><xsl:value-of select="descendant::support"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="concat(descendant::width, '*', descendant::height)"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="descendant::foliation"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="concat(descendant::layout/@columns, ' columns and ', descendant::layout/@writtenLines, ' lines.')"/></p>
    </xsl:template>
    <xsl:template match="handDesc|scriptDesc|history"/>
    
    <!-- bibliography -->
    <xsl:template match="additional">
        <h3>Bibliography</h3>
        <ul>
        <xsl:apply-templates select="descendant::bibl"></xsl:apply-templates>
        </ul>
    </xsl:template>
    
    <xsl:template match="bibl">
       
            <li><xsl:value-of select="concat(descendant::surname,', ', descendant::forename)"/>
            <xsl:text>, </xsl:text>
            <i><xsl:value-of select="title"/></i>
            <xsl:if test="num"><xsl:text>, n°</xsl:text>
            <xsl:value-of select="num"/>
            </xsl:if>
                <xsl:if test="pubPlace"><xsl:text>, </xsl:text>
                    <xsl:value-of select="pubPlace"/>
                </xsl:if>
                <xsl:if test="date"><xsl:text>, </xsl:text>
                    <xsl:value-of select="date"/>
                </xsl:if>
                <xsl:if test="biblScope"><xsl:text>, </xsl:text>
                    <xsl:value-of select="biblScope"/>
                </xsl:if>
            </li>
       
    </xsl:template>
    
    <!-- text structure -->
    <xsl:template match="descendant::div[@type='section']">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="said">
        <p>"<xsl:apply-templates/>"</p>
    </xsl:template>
    <xsl:template match="quote">
        <p>"<xsl:apply-templates/>"</p>
    </xsl:template>
    
    <!-- organising textual elements -->
    
    <!-- only seing regularisation or abbrevations development-->
    <xsl:template match="descendant::choice">
        <xsl:value-of select="reg/text() | expan/text() | expan/ex/text() "/>
    </xsl:template>
    
    <!-- dispay folio and column --> 
    <xsl:template match="cb">
        <xsl:text>[</xsl:text><xsl:value-of select="concat('fol.', preceding-sibling::pb/@n, @n)"/><xsl:text>]</xsl:text>
    </xsl:template>
    
    <!-- display index with occurrences -->
   
   <xsl:template match="person">
       <xsl:variable name="id" select="@xml:id"/>
       <li><xsl:value-of select="persName"/> : <xsl:value-of select="note"/><br/>
           <xsl:element name="i"><xsl:text>Occurences (</xsl:text><xsl:value-of select="count(ancestor-or-self::TEI//body//persName[replace(@ref, '#', '')=$id])"/><xsl:text>) : </xsl:text>
           <xsl:for-each select="ancestor-or-self::TEI//body//persName[replace(@ref, '#', '')=$id]">
               <xsl:value-of select="text()| .//expan/text() | .//ex/text() | .//reg/text()"/>
               <xsl:if test="position() != last()">, </xsl:if>
               <!--Si l'élément est différent du dernier, il y a une virgule à chaque fois. -->
               <xsl:if test="position() = last()">.</xsl:if>
               <!--Si l'élément est le dernier, il y a un point. -->
           </xsl:for-each>
           </xsl:element>
       </li>
   </xsl:template>
    
    
</xsl:stylesheet>