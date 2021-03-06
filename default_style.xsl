<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:mmax="org.eml.MMAX2.discourse.MMAX2DiscourseLoader"
xmlns:s="www.eml.org/NameSpaces/s"
xmlns:np="www.eml.org/NameSpaces/np"
xmlns:v="www.eml.org/NameSpaces/v">
<xsl:output method="text" indent="no" omit-xml-declaration="yes"/>
<xsl:strip-space elements="*"/>

<xsl:template match="words">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="word">
 <xsl:value-of select="mmax:registerDiscourseElement(@id)"/>
  <xsl:apply-templates select="mmax:getStartedMarkables(@id)" mode="opening"/>
  <xsl:value-of select="mmax:setDiscourseElementStart()"/>
   <xsl:apply-templates/>
  <xsl:value-of select="mmax:setDiscourseElementEnd()"/>
  <xsl:apply-templates select="mmax:getEndedMarkables(@id)" mode="closing"/>
<xsl:text> </xsl:text>
</xsl:template>


<xsl:template match="s:markable" mode="opening">
</xsl:template>

<xsl:template match="s:markable" mode="closing">
<xsl:text>

</xsl:text>
</xsl:template>

<xsl:template match="np:markable" mode="opening">
<xsl:value-of select="mmax:startBold()"/>
<xsl:value-of select="mmax:addLeftMarkableHandle(@mmax_level, @id, '[')"/>
<xsl:value-of select="mmax:endBold()"/>
</xsl:template>

<xsl:template match="np:markable" mode="closing">
<xsl:value-of select="mmax:startBold()"/>
<xsl:value-of select="mmax:addRightMarkableHandle(@mmax_level, @id, concat(']',@argtype), 1)"/>
<xsl:value-of select="mmax:endBold()"/>
</xsl:template>
</xsl:stylesheet>