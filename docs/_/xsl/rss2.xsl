<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:ror="http://rorweb.com/0.1/"
  exclude-result-prefixes="atom content dc ror">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  <xsl:variable name="feedUrl" select="/rss/channel/atom:link[@rel='self']/@href" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US" dir="ltr">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
        <meta name="description" content="RSS feed for jasonfbuckman.com. Feed readers read the raw XML; this page is only for humans." />
        <meta name="author" content="Jason Frederick Buckman" />
        <meta name="creator" content="Jason Frederick Buckman" />
        <meta name="designer" content="Jason Frederick Buckman" />
        <meta name="web_author" content="Jason Frederick Buckman" />
        <meta name="language" content="en-US" />
        <meta name="generator" content="Notepad++" />
        <title><xsl:value-of select="/rss/channel/title" /> — RSS Feed</title>
        <link rel="canonical" href="https://www.jasonfbuckman.com/ror.xml" />
        <link rel="alternate" type="application/xml" href="https://www.jasonfbuckman.com/sitemap.xml" />
        <link rel="alternate" type="text/plain" href="https://www.jasonfbuckman.com/urllist.txt" />
        <link rel="home" type="text/html" title="Jason Frederick Buckman" href="/" />
        <link rel="stylesheet" type="text/css" href="/_/css/rss2.css" />
      </head>
      <body>
        <div class="feed-header">
          <h1>This is a feed</h1>
          <p>This is a “feed” of frequently changing content on this site. You can subscribe to this feed to receive updates when this content changes.</p>
          <p>Subscribe to this feed using:
            <a href="https://feedly.com/i/subscription/feed/{$feedUrl}">Feedly</a> |
            <a href="https://www.inoreader.com/?add_feed={$feedUrl}">Inoreader</a> |
            <a href="https://newsblur.com/?url={$feedUrl}">NewsBlur</a>
          </p>
          <p>Feed URL: <code><xsl:value-of select="$feedUrl" /></code></p>
        </div>
        <div class="channel">
          <xsl:if test="/rss/channel/image">
            <a href="{/rss/channel/image/link}" title="Link to original website"><img src="{/rss/channel/image/url}" alt="{/rss/channel/image/title}" /></a>
          </xsl:if>
          <h1>
            <xsl:choose>
              <xsl:when test="/rss/channel/link">
                <a href="{normalize-space(/rss/channel/link)}" title="Link to original website"><xsl:value-of select="/rss/channel/title" /></a>
              </xsl:when>
              <xsl:otherwise><xsl:value-of select="/rss/channel/title" /></xsl:otherwise>
            </xsl:choose>
          </h1>
          <p class="description"><xsl:value-of select="/rss/channel/description" /></p>
          <p class="meta">
            <xsl:if test="/rss/channel/language">Language: <xsl:value-of select="/rss/channel/language" /> | </xsl:if>
            <xsl:if test="/rss/channel/lastBuildDate">Last built: <xsl:value-of select="/rss/channel/lastBuildDate" /> | </xsl:if>
            <xsl:if test="/rss/channel/generator">Generator: <xsl:value-of select="/rss/channel/generator" /></xsl:if>
          </p>
        </div>
        <h2>Current Feed Content</h2>
        <xsl:for-each select="/rss/channel/item">
          <div class="item">
            <h3 class="itemtitle">
              <xsl:choose>
                <xsl:when test="link">
                  <a href="{normalize-space(link)}"><xsl:value-of select="title" /></a>
                </xsl:when>
                <xsl:when test="guid[@isPermaLink='true']">
                  <a href="{normalize-space(guid)}"><xsl:value-of select="title" /></a>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="title" /></xsl:otherwise>
              </xsl:choose>
            </h3>
            <xsl:if test="pubDate or ror:updated or dc:creator">
              <p class="itemdate">
                <xsl:if test="pubDate">Posted: <xsl:value-of select="pubDate" /></xsl:if>
                <xsl:if test="ror:updated"> | Updated: <xsl:value-of select="ror:updated" /></xsl:if>
                <xsl:if test="dc:creator"> | By: <xsl:value-of select="dc:creator" /></xsl:if>
              </p>
            </xsl:if>
            <xsl:if test="description">
              <p class="itemdescription"><xsl:value-of select="description" /></p>
            </xsl:if>
            <!-- content:encoded is CDATA HTML. Browsers ignore disable-output-escaping, so it would show as a block of HTML text. Render the same links from the structured atom:link elements instead. -->
            <xsl:if test="atom:link[@rel='related']">
              <div class="itemcontent">
                <xsl:if test="ror:image">
                  <div><img src="{ror:image}" alt="" width="252" height="252" /></div>
                </xsl:if>
                <ul>
                  <xsl:for-each select="atom:link[@rel='related']">
                    <li><a rel="external me" href="{@href}"><xsl:value-of select="@title" /></a></li>
                  </xsl:for-each>
                </ul>
              </div>
            </xsl:if>
            <xsl:if test="ror:about or ror:type or ror:resourceOf or ror:image">
              <dl class="ror">
                <xsl:if test="ror:about"><dt>About</dt><dd><xsl:value-of select="ror:about" /></dd></xsl:if>
                <xsl:if test="ror:type"><dt>Type</dt><dd><xsl:value-of select="ror:type" /></dd></xsl:if>
                <xsl:if test="ror:resourceOf"><dt>Resource of</dt><dd><xsl:value-of select="ror:resourceOf" /></dd></xsl:if>
                <xsl:if test="ror:image"><dt>Image</dt><dd><a href="{ror:image}"><xsl:value-of select="ror:image" /></a></dd></xsl:if>
              </dl>
            </xsl:if>
            <p class="guid">GUID: <xsl:value-of select="guid" /></p>
          </div>
        </xsl:for-each>
        <div class="footer">
          <p>Feed readers read the raw XML; this page is only for humans. Also available as <a href="https://www.jasonfbuckman.com/sitemap.xml">sitemap.xml</a> and <a href="https://www.jasonfbuckman.com/urllist.txt">urllist.txt</a>.</p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
