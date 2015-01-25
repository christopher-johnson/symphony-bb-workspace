<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                version="1.0">


    <xsl:import href="../utilities/page-title.xsl"/>
    <xsl:import href="../utilities/navigation.xsl"/>
    <xsl:import href="../utilities/date-time.xsl"/>

    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                omit-xml-declaration="yes"
                encoding="UTF-8"
                indent="yes" />

    <xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>
    <xsl:variable name="works" select="data/listwork"/>
    <xsl:template match="/">

        <html>
            <head>
                <title>
                    <xsl:call-template name="page-title"/>
                </title>
                <link rel="icon" type="images/png" href="{$workspace}/images/icons/bookmark.png" />
                <link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/css/styles.css" />
                <link rel="alternate" type="application/rss+xml" href="{$root}/rss/" />
            </head>
            <body>
                <div id="masthead">
                    <h1>
                        <a href="{$root}"><xsl:value-of select="$website-name"/></a>
                    </h1>
                    <xsl:apply-templates select="data/navigation"/>
                </div>
                <div id="package">
                    <div id="content">
                        <xsl:apply-templates mode="brdata" select="//*[name()='list']/node()"/>
                    </div>
                </div>
                <ul id="footer">
                    <li>Broadcasted via <a class="rss" href="{$root}/rss/">XML Feed</a></li>
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="node()" mode="brdata" priority="2.5">
            <table style="width: 100%" border="1">
                <tbody>
                    <tr>
                        <td width="5%">
                        <xsl:value-of select="current()/@n"/>
                        </td>
                        <td width="12%">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="./t:bibl/t:note[@type='Abfassungsevent']/t:listEvent/t:event/t:note/t:date"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="./t:bibl/t:placeName"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td width="25%">
                        <table>
                            <tbody>
                                <tr>
                                    <xsl:if test="./t:bibl/t:respStmt/t:resp[@key='abs']">
                                    <td width="5%">
                                        <span>A:</span>
                                    </td>
                                    <td>
                                        <xsl:value-of select="./t:bibl/t:respStmt/t:persName[@resp='abs']"/>
                                    </td>
                                    </xsl:if>
                                </tr>
                                <tr>
                                    <xsl:if test="./t:bibl/t:respStmt/t:resp[@key='abs']">
                                        <td width="5%">
                                            <span>E:</span>
                                        </td>
                                        <td>
                                        <xsl:value-of select="./t:bibl/t:respStmt/t:persName[@resp='emp']"/>
                                        </td>
                                    </xsl:if>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                        <td>
                            <span>
                                <xsl:variable name="desc" select="./t:bibl/t:note[@type='title']"/>
                                <xsl:value-of select="$desc"/>
                            </span>
                            <table border="1">
                                <tbody>
                                    <xsl:if test="./t:bibl/t:note[@type='Überlieferung']">
                                    <tr>
                                        <td width="8%">
                                            <span>Überl.:</span>
                                        </td>
                                        <td width="92%">
                                            <xsl:value-of select="./t:bibl/t:note[@type='Überlieferung']"/>
                                        </td>
                                     </tr>
                                    </xsl:if>
                                    <xsl:if test="./t:bibl/t:note[@type='Werke']">
                                    <tr>
                                        <td width="8%">
                                            <span>Werke.:</span>
                                        </td>
                                        <td width="92%">
                                            <xsl:value-of select="./t:bibl/t:note/t:bibl/t:relatedItem/t:bibl"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./t:bibl/t:note[@type='Drucke']">
                                    <tr>
                                        <td width="8%">
                                            <span>Dr.:</span>
                                        </td>
                                        <td width="92%">
                                            <xsl:value-of select="./t:bibl/t:note[@type='Drucke']"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./t:bibl/t:note[@type='Objekte']">
                                    <tr>
                                        <td width="8%">
                                            <span>Obj.:</span>
                                        </td>
                                        <td width="92%">
                                            <xsl:value-of select="./t:bibl/t:note[@type='Objekte']"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./t:bibl/t:note[@type='Edition']">
                                    <tr>
                                        <td width="8%">
                                            <span>Ed.:</span>
                                        </td>
                                        <td width="92%">
                                            <xsl:value-of select="./t:bibl/t:note/t:bibl/t:edition"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./t:bibl/t:note[@type='Anmerkung']">
                                    <tr>
                                        <td width="8%">
                                            <span>Anm.:</span>
                                        </td>
                                        <td width="92%">
                                            <xsl:value-of select="./t:bibl/t:note[@type='Anmerkung']"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./t:bibl/t:note[@type='ref']">
                                            <xsl:for-each select="./t:bibl/t:note/t:ref">
                                               <xsl:if test="current()/@type='pdf'">
                                                <tr>
                                                    <td width="8%">
                                                        <span>PDF:</span>
                                                    </td>
                                                    <td width="92%">
                                                        <a xmlns="http://www.w3.org/1999/xhtml" href="{@target}"><xsl:value-of select="../t:rs[@type='pdf']"/></a>
                                                    </td>
                                                </tr>
                                               </xsl:if>
                                                <xsl:if test="current()/@type='html'">
                                                    <tr>
                                                        <td width="8%">
                                                            <span>HTML:</span>
                                                        </td>
                                                        <td width="92%">
                                                            <a xmlns="http://www.w3.org/1999/xhtml" href="{@target}"><xsl:value-of select="../t:rs[@type='html']"/></a>
                                                        </td>
                                                    </tr>
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:if>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
    </xsl:template>
</xsl:stylesheet>