<xsl:transform
        version="2.0"
        xmlns:fo="http://www.w3.org/1999/XSL/Format"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../utilities/attributes.xsl"/>

    <xsl:template match="/" priority="1000">
        <!-- Store generated xsl-fo document in variable-->
        <xsl:variable name="xsl-fo-document">
            <xsl:next-match/>
        </xsl:variable>

        <!-- Copy everything to result document and apply "css" -->
        <xsl:apply-templates select="$xsl-fo-document" mode="css"/>
    </xsl:template>

    <xsl:template match="@*|node()" priority="1000" mode="css">
        <xsl:param name="copy" select="true()" tunnel="yes"/>
        <xsl:if test="$copy">
            <xsl:copy>
                <xsl:next-match>
                    <xsl:with-param name="copy" select="false()" tunnel="yes"/>
                </xsl:next-match>
                <xsl:apply-templates select="@*|node()" mode="css"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <!-- **************************** -->
    <!-- CSS Examples (e.g. fo:table) -->
    <!-- **************************** -->

    <xsl:template match="fo:table-header/fo:table-row/fo:table-cell" mode="css">
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="padding-start">0.3em</xsl:attribute>
        <xsl:attribute name="padding-end">0.2em</xsl:attribute>
        <xsl:attribute name="padding-before">2pt</xsl:attribute>
        <xsl:attribute name="padding-after">2pt</xsl:attribute>
        <xsl:next-match/>
    </xsl:template>

</xsl:transform>