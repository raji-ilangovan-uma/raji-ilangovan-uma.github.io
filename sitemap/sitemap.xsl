<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
	<html>
	<head>
		<title>XML Sitemap</title>
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
		<link rel="stylesheet" type="text/css" href="sitemap/sitemap.css"/>
	</head>
	<body>
		<header>
			<h1 class="blog-title">Where's Amma?</h1>
		</header>

		<main>
			<h1>XML Sitemap</h1>

			<section>
				<h2>Homepage</h2>
				<xsl:call-template name="process-priority">
					<xsl:with-param name="priority" select="'1.00'"/>
				</xsl:call-template>
			</section>

			<section>
				<h2>Blog Posts</h2>
				<xsl:call-template name="process-priority">
					<xsl:with-param name="priority" select="'0.80'"/>
				</xsl:call-template>
			</section>
		</main>

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

<xsl:template name="process-priority">
	<xsl:param name="priority"/>
	<div class="url-list">
		<xsl:for-each select="/sitemap:urlset/sitemap:url[sitemap:priority = $priority]">
			<a href="{sitemap:loc}">
				<xsl:value-of select="sitemap:title"/>
			</a>
		</xsl:for-each>
	</div>
</xsl:template>

</xsl:stylesheet>