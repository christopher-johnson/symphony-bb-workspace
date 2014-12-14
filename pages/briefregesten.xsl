<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias">

    <xsl:import href="../utilities/page-title.xsl"/>
    <xsl:import href="../utilities/navigation.xsl"/>
    <xsl:import href="../utilities/attributes.xsl"/>

<xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>


<xsl:variable name="is-logged-in" select="/data/logged-in-author/author"/>

    <xsl:template match="/">
    <fo:root>
        <fo:layout-master-set>
            <fo:simple-page-master master-name="A4" page-width="210mm"
                                   page-height="297mm" margin-top="1cm" margin-bottom="1cm"
                                   margin-left="1cm" margin-right="1cm">
                <fo:region-body margin="1cm"/>
                <fo:region-before extent="1cm"/>
                <fo:region-after extent="1cm"/>
                <fo:region-start extent="1cm"/>
                <fo:region-end extent="1cm"/>
            </fo:simple-page-master>
        </fo:layout-master-set>
             <fo:page-sequence master-reference="A4">
               <fo:static-content flow-name="xsl-region-before">
                   <fo:block xsl:use-attribute-sets="h4"> Blumenbach TEI Datenbank: Briefregesten</fo:block>
               </fo:static-content>
                 <fo:static-content flow-name="xsl-region-after">
                     <fo:list-block>
                         <fo:list-item>
                             <fo:list-item-label>
                                 <fo:block></fo:block>
                             </fo:list-item-label>
                             <fo:list-item-body>
                                 <fo:block>
                                     Generated: <xsl:value-of select="$today"/>
                                 </fo:block>
                             </fo:list-item-body>
                         </fo:list-item>
                         <fo:list-item>
                             <fo:list-item-label>
                                 <fo:block></fo:block>
                             </fo:list-item-label>
                             <fo:list-item-body>
                                 <fo:block>

                                 </fo:block>
                             </fo:list-item-body>
                         </fo:list-item>
                     </fo:list-block>
                     <fo:block font-size="9pt" text-align="outside">
                        <fo:page-number/>
                     </fo:block>
                 </fo:static-content>
                   <fo:flow flow-name="xsl-region-body">
                       <fo:block xsl:use-attribute-sets="h4">
                           <a href="{$root}"><xsl:value-of select="$website-name"/></a>
                           <xsl:apply-templates select="data/navigation"/>
                       </fo:block>
                   <fo:table xsl:use-attribute-sets="table.data">
                        <fo:table-column column-width="15%" column-number="1"/>
                        <fo:table-column column-width="15%" column-number="2"/>
                        <fo:table-column column-width="70%" column-number="3"/>

                        <fo:table-header xsl:use-attribute-sets="table.data.th">
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">TEI Element</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold"></fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Value</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>

                        <fo:table-body start-indent="0pt" text-align="start">
                           <xsl:apply-templates mode="brdata" select="//*[name()='teiHeader']/node()"/>
                        </fo:table-body>
                    </fo:table>
                   </fo:flow>
            </fo:page-sequence>
 </fo:root>
   </xsl:template>

    <xsl:template match="node()" mode="brdata" priority="2.5">
         <xsl:if test="./t:titleStmt/t:author/t:persName != ''">
            <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                <fo:block>TitleStmt</fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    Author:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:titleStmt/t:author/t:persName"/>
                </fo:block>
            </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:titleStmt/t:title != ''">
            <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                <fo:block></fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    Title:
                </fo:block>
            </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                        <xsl:value-of select="./t:titleStmt/t:title"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:publicationStmt/t:idno/t:idno[@type='URLXML'] != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block>
                        PubStmt
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        URLXML:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                        <xsl:value-of select="./t:publicationStmt/t:idno/t:idno[@type='URLXML']"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:seriesStmt/t:biblScope != ''">
            <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                <fo:block>
                SeriesStmt
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    Bibl:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:seriesStmt/t:biblScope"/>
                </fo:block>
            </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:notesStmt/t:note/* != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block>
                        NotesStmt
                    </fo:block>
                </fo:table-cell>
                <xsl:if test="./t:notesStmt/t:note != ''">
                    <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                        <fo:block>
                           Note:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                        <fo:block>
                            <xsl:value-of select="./t:notesStmt/t:note"/>
                        </fo:block>
                    </fo:table-cell>
                </xsl:if>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:notesStmt/t:note/t:rs[@type='object'] != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Object:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                        <xsl:value-of select="./t:notesStmt/t:note/t:rs[@type='object']"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:notesStmt/t:note/t:rs[@type='bibl'] != ''">
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="table.data.td1">
             <fo:block></fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                  <fo:block>
                    Bibl:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:notesStmt/t:note/t:rs[@type='bibl']"/>
                </fo:block>
            </fo:table-cell>
             </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:notesStmt/t:note/t:rs[@type='lz'] != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Lit:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                        <xsl:value-of select="./t:notesStmt/t:note/t:rs[@type='lz']"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
           <xsl:if test="./t:notesStmt/t:note/t:ref/@target != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    Reference:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:notesStmt/t:note/t:ref/@target"/>
                </fo:block>
            </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:notesStmt/t:note/t:rs[@type='edition'] != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    Edition:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:notesStmt/t:note/t:rs[@type='edition']"/>
                </fo:block>
            </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:sourceDesc/t:listEvent/t:event[@type='iso-origin']">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block>
                        SourceStmt
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Event Date:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                          <xsl:value-of select="./t:sourceDesc/t:listEvent/t:event[@type='iso-origin']/@when"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:sourceDesc/t:listEvent/t:event[@type='julian-origin']" >
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Julian Date:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                         <xsl:value-of select="./t:sourceDesc/t:listEvent/t:event[@type='julian-origin']/@when"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:sourceDesc/t:listEvent/t:event/t:label != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Date Label:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                          <xsl:value-of select="./t:sourceDesc/t:listEvent/t:event/t:label"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:sourceDesc/t:listPlace/t:place/t:placeName != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Event Place:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                        <xsl:value-of select="./t:sourceDesc/t:listPlace/t:place/t:placeName"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:sourceDesc/t:biblFull/t:titleStmt/t:title != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                    <fo:block>
                        Source:
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                    <fo:block>
                        <xsl:value-of select="./t:sourceDesc/t:biblFull/t:titleStmt/t:title"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:creation/t:persName != ''">
            <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                <fo:block>
                    ProfileStmt
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    Empfanger:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:creation/t:persName"/>
                </fo:block>
            </fo:table-cell>
            </fo:table-row>
        </xsl:if>
        <xsl:if test="./t:textClass/t:classCode[@scheme='RegNr'] != ''">
            <fo:table-row>
                <fo:table-cell xsl:use-attribute-sets="table.data.td1">
                    <fo:block></fo:block>
                </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td2">
                <fo:block>
                    RegNr:
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="table.data.td3">
                <fo:block>
                    <xsl:value-of select="./t:textClass/t:classCode[@scheme='RegNr']"/>
                </fo:block>
            </fo:table-cell>
            </fo:table-row>
        <fo:table-row>
            <fo:table-cell>
                <fo:block><fo:leader /></fo:block>
            </fo:table-cell>
        </fo:table-row>
        </xsl:if>
        </xsl:template>
 </xsl:stylesheet>



