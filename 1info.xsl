<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="teacher-to-course" match="teacher" use="." />
    <xsl:key name="keyword-to-course" match="keyword" use="." />

    <xsl:template match="/">
        <html>
            <body>

                <h1>Наши курсы</h1>

                <xsl:variable name="targetTeacher">Борисов И.О.</xsl:variable>

                <h3>Курсы, которые читает <xsl:value-of select="$targetTeacher"/></h3>
                <ul>
                    <xsl:for-each select="key('teacher-to-course', $targetTeacher)">
                        <li>
                            <xsl:value-of select="../../title"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, которые используют XML</h3>
                <ul>
                    <xsl:for-each select="key('keyword-to-course', 'XML')">
                        <li>
                            <xsl:value-of select="../../title"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, которые читает <xsl:value-of select="$targetTeacher"/> и используют XSLT</h3>
                <ul>
                    <xsl:for-each select="key('teacher-to-course', $targetTeacher)">
                        <xsl:if test="../../keywords/keyword = 'XSLT'">
                            <li>
                                <xsl:value-of select="../../title"/>
                            </li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
