<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
	<html>
	<head>
		<title>RSS Feed</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>

		<!-- Favicon -->
		<link rel="icon" href="./favicon.ico" type="image/x-icon"/>

		<!-- Fonts -->
		<link rel="preconnect" href="https://fonts.googleapis.com"/>
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
		<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&amp;family=Lato:wght@300;400;700&amp;display=swap" rel="stylesheet"/>

		<!-- Custom CSS -->
		<link rel="stylesheet" type="text/css" href="main.css"/>
		<link rel="stylesheet" type="text/css" href="secondary.css"/>
		<link rel="stylesheet" type="text/css" href="rss/rss.css"/>
	</head>
	<body>
		<!-- ══ HEADER ══ -->
		<header>
			<h1 class="blog-title">Where's Amma?</h1>
		</header>

		<main>
			<h1>RSS Feed</h1>
			<div id="rss-validator"><a rel="external" target="_blank" href="http://validator.w3.org/feed/check.cgi?url=https%3A//raji-ilangovan-uma.github.io/rss.xml"><img src="rss/valid-rss-rogers.png" alt="[Valid RSS]" title="Validate my RSS feed" /></a></div>

			<xsl:call-template name="process-category">
				<xsl:with-param name="category" select="'Blog Posts'"/>
			</xsl:call-template>
		</main>

		<!-- ══ FOOTER ══ -->
		<footer>
			<div class="footer-title">Where's Amma?</div>
			<div class="footer-links">
				<a href="rss.xml">RSS</a>
				<a href="sitemap.xml">Sitemap</a>
			</div>
			<p class="footer-copy">© 2026 Raji Ilangovan Uma · All rights reserved.</p>
		</footer>
	</body>
	</html>
</xsl:template>

<xsl:template name="process-category">
	<xsl:param name="category"/>
	<div class="url-list">
		<xsl:for-each select="/rss/channel/item[category = $category]">
			<a class="article-container" rel="external" target="_blank" href="{link}" aria-label="{title}">
				<article>
					<img src="{enclosure/@url}" alt="{title}" />
					<div>
						<h3><xsl:value-of select="title"/></h3>
						<p class="desc"><xsl:value-of select="description"/></p>
						<p class="date"><xsl:value-of select="substring(pubDate, 6, string-length(pubDate)-18)"/></p>
					</div>
				</article>
			</a>
		</xsl:for-each>
	</div>
</xsl:template>

</xsl:stylesheet>