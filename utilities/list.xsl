<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        Example:

        <xsl:call-template name="nl2br">
            <xsl:with-param name="string" select="body"/>
        </xsl:call-template>
    -->
<xsl:template name="lister">
<fileList>
    <xsl:for-each
            select="collection('./?select=*.xml;recurse=yes;on-error=warning')" >
        <xsl:element name='file'>
            <xsl:attribute name="full" select="document-uri(.)"/>
            <xsl:value-of select="tokenize(document-uri(.), '/')[last()]"/>
        </xsl:element>
    </xsl:for-each>
</fileList>
</xsl:template>
        </xsl:stylesheet>