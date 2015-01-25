<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="pSeparators">&#xA;&#x9;&#x20;,.;:?!()'"</xsl:param>
    <xsl:template name="wrap">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="p/text()" name="tokenize">
        <xsl:param name="pString" select="."/>
        <xsl:param name="pMask"
                   select="translate(.,translate(.,$pSeparators,''),'')"/>
        <xsl:param name="pCount" select="1"/>
        <xsl:choose>
            <xsl:when test="not($pString)"/>
            <xsl:when test="$pMask">
                <xsl:variable name="vSeparator"
                              select="substring($pMask,1,1)"/>
                <xsl:variable name="vString"
                              select="substring-before($pString,$vSeparator)"/>
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="pString" select="$vString"/>
                    <xsl:with-param name="pMask"/>
                    <xsl:with-param name="pCount" select="$pCount"/>
                </xsl:call-template>
                <xsl:value-of select="$vSeparator"/>
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="pString"
                                    select="substring-after($pString,$vSeparator)"/>
                    <xsl:with-param name="pMask"
                                    select="substring($pMask,2)"/>
                    <xsl:with-param name="pCount"
                                    select="$pCount + boolean($vString)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <span class="word-{$pCount}">
                    <xsl:value-of select="$pString"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" id="text.wrap"
                    xmlns:str="http://www.ora.com/XSLTCookbook/namespaces/strings"
                    xmlns:text="http://www.ora.com/XSLTCookbook/namespaces/text"
                    exclude-result-prefixes="text"> <xsl:include href="../strings/str.find-last.xslt"/>
        <xsl:include href="text.justify.xslt"/> <xsl:template match="node( ) | @*" mode="text:wrap" name="text:wrap"> <xsl:param name="input" select="normalize-space( )"/> <xsl:param name="width" select="70"/> <xsl:param name="align-width" select="$width"/> <xsl:param name="align" select=" 'left' "/> <xsl:if test="$input"> <xsl:variable name="line"> <xsl:choose> <xsl:when test="string-length($input) > $width"> <xsl:call-template name="str:substring-before-last"> <xsl:with-param name="input" select="substring($input,1,$width)"/> <xsl:with-param name="substr" select=" ' ' "/> </xsl:call-template> </xsl:when> <xsl:otherwise> <xsl:value-of select="$input"/> </xsl:otherwise> </xsl:choose> </xsl:variable> <xsl:if test="$line">
</xsl:stylesheet>