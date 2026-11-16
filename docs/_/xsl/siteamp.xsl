<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:s="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="s image xhtml">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US" dir="ltr">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <meta name="mobile-web-app-capable" content="no" />
        <meta name="apple-mobile-web-app-capable" content="no" />
        <meta name="description" content="This is the XML sitemap for jasonfbuckman.com. Search engines read the raw XML; this table is only for humans." />
        <meta name="author" content="Jason Frederick Buckman" />
        <meta name="creator" content="Jason Frederick Buckman" />
        <meta name="designer" content="Jason Frederick Buckman" />
        <meta name="web_author" content="Jason Frederick Buckman" />
        <meta name="language" content="en-US" />
        <meta name="generator" content="Notepad++" />
        <title>XML Sitemap — jasonfbuckman.com</title>
        <link rel="canonical" href="https://www.jasonfbuckman.com/sitemap.xml" />
        <link rel="alternate" type="text/plain" href="https://www.jasonfbuckman.com/urllist.txt" />
        <link rel="alternate" type="application/rss+xml" href="https://www.jasonfbuckman.com/ror.xml" />
        <link rel="home" type="text/html" title="Jason Frederick Buckman" href="/" />
        <link rel="author" type="text/html" title="Jason Frederick Buckman" href="/" />
        <link rel="stylesheet" type="text/css" href="/_/css/sitemap.css" />
      </head>
      <body>
        <h1>XML Sitemap</h1>
        <p>This is the XML sitemap for jasonfbuckman.com. Search engines read the raw XML; this table is only for humans.</p>
        <table>
          <tr>
            <th>URL</th>
            <th>Last modified</th>
            <th>Priority</th>
            <th>Image</th>
            <th>Languages</th>
          </tr>
          <xsl:for-each select="s:urlset/s:url">
            <tr>
              <td><a href="{s:loc}"><xsl:value-of select="s:loc"/></a></td>
              <td><xsl:value-of select="s:lastmod"/></td>
              <td><xsl:value-of select="s:priority"/></td>
              <td>
                <xsl:for-each select="image:image">
                  <a href="{image:loc}"><xsl:value-of select="image:loc"/></a>
                  <xsl:if test="image:title"> (<xsl:value-of select="image:title"/>)</xsl:if>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="xhtml:link">
                  <xsl:value-of select="@hreflang"/>: <a href="{@href}"><xsl:value-of select="@href"/></a><br />
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
