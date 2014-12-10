<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                xmlns ="http://www.w3.org/1999/xhtml">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/nl2br.xsl"/>

<xsl:output method="xml"
            doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
            omit-xml-declaration="yes"
            encoding="UTF-8"
            indent="yes" />

<xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>

<xsl:template match="text()" />
<xsl:template match="/">

<html>
      <head>
            <title>
                <xsl:call-template name="page-title">

                </xsl:call-template>
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
                    <xsl:apply-templates select="data/navigation">

                    </xsl:apply-templates>
              </div>

           <div id="package">

            <div id="content">
                  <table>
                      <xsl:apply-templates mode="header" select="//*[name()='teiHeader']/node()"/>
                   </table>
              </div>
           </div>
              <ul id="footer">
                    <li>Orchestrated by <a class="symphony" href="http://getsymphony.com/">Symphony</a></li>
                    <li>Broadcasted via <a class="rss" href="{$root}/rss/">XML Feed</a></li>
              </ul>
       </body>
 </html>

</xsl:template>

    <xsl:template match="node()" mode="header" priority="2.5">
        <xsl:if test="./t:publicationStmt/t:date">
        <tr>
            <td>
            Date:
            </td>
            <td>
                 <xsl:value-of select="./t:publicationStmt/t:date"/>
            </td>
        </tr>
        </xsl:if>
        <xsl:if test="./t:publicationStmt/t:pubPlace">
            <tr>
                <td>
                    Place:
                </td>
                <td>
                    <xsl:value-of select="./t:publicationStmt/t:pubPlace"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./t:titleStmt/t:author/t:persName">
            <tr>
                <td>
                    Author:
                </td>
                <td>
                    <xsl:value-of select="./t:titleStmt/t:author/t:persName"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="./t:titleStmt/t:title">
             <tr>
                 <td>
                    Title:
                 </td>
                 <td>
                    <xsl:value-of select="./t:titleStmt/t:title"/>
                 </td>
             </tr>
        </xsl:if>
        <xsl:if test="./t:textClass/t:classCode[@scheme='RegNr']">
            <tr>
                <td>
                    RegNr:
                </td>
                <td>
                    <xsl:value-of select="./t:textClass/t:classCode[@scheme='RegNr']"/>
                </td>
            </tr>
            <p> </p>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>



