<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    
  <!-- Declaration of the output format
    <xsl:output method="html" indent="yes"/>
    -->
    
 
  <!--  Empty rule - default output
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    -->  
    
   <!-- Parse an element and englobe it with tags
    <xsl:template match="tei:said">
        <p><xsl:value-of select="."/></p>
    </xsl:template>
    -->
    
    <!-- Parse the complete tree, select only said, put all child text between tags
    <xsl:template match="/">
        <p><xsl:value-of select="//tei:said"/></p>
    </xsl:template>
    -->
    
  <!--  Parse the tree, only apply the rules for said elements, englobe each said between tags
    <xsl:template match="/">
       <xsl:apply-templates select="//tei:said"/>
    </xsl:template>
   <xsl:template match="tei:said">
       <p><xsl:value-of select="."/></p>
   </xsl:template>
  -->  
    
    
</xsl:stylesheet>