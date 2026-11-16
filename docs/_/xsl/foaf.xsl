<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:schema="https://schema.org/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:contact="http://www.w3.org/2000/10/swap/pim/contact#"
  xmlns:air="http://www.daml.org/2001/10/html/airport-ont#"
  xmlns:pos="http://www.w3.org/2003/01/geo/wgs84_pos#"
  xmlns:wn="http://xmlns.com/wordnet/1.6/"
  xmlns:uranai="http://kota.s12.xrea.com/vocab/uranai/"
  xmlns:admin="http://webns.net/mvcb/"
  exclude-result-prefixes="rdf foaf schema dc dcterms contact air pos wn uranai admin">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US" dir="ltr">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <meta name="description" content="FOAF profile for Jason Frederick Buckman. Machines read the raw RDF; this page is only for humans." />
        <meta name="author" content="Jason Frederick Buckman" />
        <meta name="creator" content="Jason Frederick Buckman" />
        <meta name="designer" content="Jason Frederick Buckman" />
        <meta name="web_author" content="Jason Frederick Buckman" />
        <meta name="language" content="en-US" />
        <meta name="generator" content="Notepad++" />
        <title>Jason Frederick Buckman — FOAF Profile</title>
        <link rel="canonical" href="https://www.jasonfbuckman.com/foaf.rdf" />
        <link rel="alternate" type="text.html" href="https://www.jasonfbuckman.com/" />
        <link rel="home" type="text/html" title="Jason Frederick Buckman" href="/" />
        <link rel="stylesheet" type="text/css" href="/_/css/foaf.css" />
      </head>
      <body>
        <div class="profile-header">
          <h1>This is a FOAF profile</h1>
          <p>This is a FOAF (Friend of a Friend) profile document for Jason Frederick Buckman. Machines read the raw RDF; this page is only for humans.</p>
        </div>
        <xsl:for-each select="/rdf:RDF/foaf:Person">
          <div class="person">
            <xsl:if test="foaf:img">
              <img src="{foaf:img/@rdf:resource}" alt="{foaf:name}" width="252" height="252" />
            </xsl:if>
            <h1><xsl:value-of select="foaf:name" /></h1>
            <dl class="details">
              <xsl:if test="foaf:givenName"><dt>Given name</dt><dd><xsl:value-of select="foaf:givenName" /></dd></xsl:if>
              <xsl:if test="schema:additionalName"><dt>Additional name</dt><dd><xsl:value-of select="schema:additionalName" /></dd></xsl:if>
              <xsl:if test="foaf:familyName"><dt>Family name</dt><dd><xsl:value-of select="foaf:familyName" /></dd></xsl:if>
              <xsl:if test="foaf:gender"><dt>Gender</dt><dd><xsl:value-of select="foaf:gender" /></dd></xsl:if>
              <xsl:if test="uranai:starsign"><dt>Starsign</dt><dd><xsl:value-of select="uranai:starsign" /></dd></xsl:if>
              <xsl:if test="foaf:myersBriggs"><dt>Myers-Briggs</dt><dd><xsl:value-of select="foaf:myersBriggs" /></dd></xsl:if>
              <xsl:if test="schema:nationality"><dt>Nationality</dt><dd><xsl:value-of select="schema:nationality" /></dd></xsl:if>
              <xsl:if test="schema:knowsLanguage"><dt>Language</dt><dd><xsl:value-of select="schema:knowsLanguage" /></dd></xsl:if>
            </dl>
            <h2>Homepages</h2>
            <ul>
              <xsl:if test="foaf:homepage"><li>Homepage: <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource" /></a></li></xsl:if>
              <xsl:for-each select="foaf:schoolHomepage"><li>School: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource" /></a></li></xsl:for-each>
              <xsl:if test="foaf:workplaceHomepage"><li>Workplace: <a href="{foaf:workplaceHomepage/@rdf:resource}"><xsl:value-of select="foaf:workplaceHomepage/@rdf:resource" /></a></li></xsl:if>
            </ul>
            <xsl:if test="foaf:tipjar">
              <h2>Tip jar</h2>
              <ul>
                <xsl:for-each select="foaf:tipjar">
                  <li><a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource" /></a></li>
                </xsl:for-each>
              </ul>
            </xsl:if>
            <xsl:if test="contact:nearestAirport">
              <h2>Nearest airport</h2>
              <xsl:for-each select="contact:nearestAirport/wn:Airport">
                <dl class="details">
                  <dt>Airport</dt><dd><a href="{@rdf:about}"><xsl:value-of select="@rdf:about" /></a></dd>
                  <xsl:if test="air:iataCode"><dt>IATA</dt><dd><xsl:value-of select="air:iataCode" /></dd></xsl:if>
                  <xsl:if test="air:icaoCode"><dt>ICAO</dt><dd><xsl:value-of select="air:icaoCode" /></dd></xsl:if>
                  <xsl:if test="pos:lat"><dt>Latitude</dt><dd><xsl:value-of select="pos:lat" /></dd></xsl:if>
                  <xsl:if test="pos:long"><dt>Longitude</dt><dd><xsl:value-of select="pos:long" /></dd></xsl:if>
                </dl>
              </xsl:for-each>
            </xsl:if>
            <xsl:if test="foaf:account">
              <h2>Online accounts</h2>
              <table>
                <tr>
                  <th>Service</th>
                  <th>Profile</th>
                  <th>Account name</th>
                  <th>Type</th>
                </tr>
                <xsl:for-each select="foaf:account">
                  <tr>
                    <td>
                      <xsl:choose>
                        <xsl:when test=".//foaf:accountProfilePage[contains(@rdf:resource, 'm.me')]">Messenger</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'facebook.com')]">Facebook</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'twitter.com')]">Twitter</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'linkedin.com')]">LinkedIn</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'instagram.com')]">Instagram</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'threads.com')]">Threads</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'flickr.com')]">Flickr</xsl:when>
                        <xsl:when test=".//foaf:accountServiceHomepage[contains(@rdf:resource, 'snapchat.com')]">Snapchat</xsl:when>
                        <xsl:otherwise><a href="{.//foaf:accountServiceHomepage/@rdf:resource}"><xsl:value-of select=".//foaf:accountServiceHomepage/@rdf:resource" /></a></xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td><a href="{.//foaf:accountProfilePage/@rdf:resource}"><xsl:value-of select=".//foaf:accountProfilePage/@rdf:resource" /></a></td>
                    <td><xsl:value-of select=".//foaf:accountName" /></td>
                    <td>
                      <xsl:choose>
                        <xsl:when test=".//foaf:OnlineChatAccount">Online chat account</xsl:when>
                        <xsl:otherwise>Online account</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </xsl:if>
          </div>
        </xsl:for-each>
        <xsl:if test="/rdf:RDF/foaf:PersonalProfileDocument">
          <h2>About this document</h2>
          <dl class="details">
            <xsl:if test="/rdf:RDF/foaf:PersonalProfileDocument/dc:type"><dt>Type</dt><dd><xsl:value-of select="/rdf:RDF/foaf:PersonalProfileDocument/dc:type" /></dd></xsl:if>
            <xsl:if test="/rdf:RDF/foaf:PersonalProfileDocument/dc:format"><dt>Format</dt><dd><xsl:value-of select="/rdf:RDF/foaf:PersonalProfileDocument/dc:format" /></dd></xsl:if>
            <xsl:if test="/rdf:RDF/foaf:PersonalProfileDocument/dcterms:extent"><dt>Size</dt><dd><xsl:value-of select="/rdf:RDF/foaf:PersonalProfileDocument/dcterms:extent" /> bytes</dd></xsl:if>
            <xsl:if test="/rdf:RDF/foaf:PersonalProfileDocument/admin:generatorAgent"><dt>Generator</dt><dd><a href="{/rdf:RDF/foaf:PersonalProfileDocument/admin:generatorAgent/@rdf:resource}"><xsl:value-of select="/rdf:RDF/foaf:PersonalProfileDocument/admin:generatorAgent/@rdf:resource" /></a></dd></xsl:if>
            <xsl:if test="/rdf:RDF/foaf:PersonalProfileDocument/admin:errorsReportTo"><dt>Errors to</dt><dd><a href="{/rdf:RDF/foaf:PersonalProfileDocument/admin:errorsReportTo/@rdf:resource}"><xsl:value-of select="/rdf:RDF/foaf:PersonalProfileDocument/admin:errorsReportTo/@rdf:resource" /></a></dd></xsl:if>
          </dl>
        </xsl:if>
        <div class="footer">
          <p>Machines read the raw RDF; this page is only for humans. Also available at <a href="https://www.jasonfbuckman.com/">main site</a></p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
