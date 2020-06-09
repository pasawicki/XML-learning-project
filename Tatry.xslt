<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2></h2>
  <xsl:apply-templates/>
  </body>
  </html>
</xsl:template>

<xsl:template match="Tatry">
<html>
<body>
<xsl:apply-templates select="obiekt">
   <xsl:sort select="wysokosc" order="descending"/>
</xsl:apply-templates>
</body>
</html>
</xsl:template>

<xsl:template match="obiekt">
<html>
<body>
   <xsl:text>Nazwa obiektu: </xsl:text>
   <xsl:value-of select="./nazwa" />
   <xsl:text>;</xsl:text>
   <br />

   <xsl:text>Typ obiektu: </xsl:text>
   <xsl:value-of select="./@typ" />
   <xsl:text>;</xsl:text>
   <br />

   <xsl:text>Położenie w metrach npm.: </xsl:text>
   <xsl:value-of select="./wysokosc" />
   <xsl:text>;</xsl:text>
   <br />

   <xsl:text>Przynależność geograficzna: </xsl:text>
   <xsl:value-of select="./polozenie/pasmo" />
   <xsl:text>;</xsl:text>
   <br />

   <xsl:text>Przynależność państwowa: </xsl:text>
   <xsl:value-of select="./polozenie/przynaleznosc" />
   <xsl:text>;</xsl:text>
   <br />

   <xsl:text>Obecność szlaku: </xsl:text>
   <xsl:value-of select="./szlak" />
   <xsl:text>;</xsl:text>
   <br />

   <xsl:text>Trudność dotarcia: </xsl:text>
          <xsl:if test="@typ=&quot;szczyt&quot;">
          <b style="color:Purple;"><xsl:value-of select="trudnosc_trasy"/></b>
          </xsl:if>

          <xsl:if test="@typ=&quot;przełęcz&quot;">
          <b style="color:Red;"><xsl:value-of select="trudnosc_trasy"/></b>
          </xsl:if>

          <xsl:if test="@typ=&quot;staw&quot;">
          <b style="color:Blue;"><xsl:value-of select="trudnosc_trasy"/></b>
          </xsl:if>


          <xsl:if test="@typ=&quot;hala&quot;">
          <b style="color:Green;"><xsl:value-of select="trudnosc_trasy"/></b>
          </xsl:if>
   <xsl:text>.</xsl:text>
   <br />
</body>
</html>
</xsl:template>
</xsl:stylesheet>