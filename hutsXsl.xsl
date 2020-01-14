<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Каталог на хижите в България</title>

				<link rel="stylesheet" type="text/css" href="style.css" />
			</head>
			<script>
		function showHuts() {
			document.getElementById('hutContainer').style.display = 'inline';
            document.getElementById('shelterContainer').style.display = 'none';
			document.getElementById('mountainContainer').style.display = 'none';
    };
		function showShelters() {
            document.getElementById('hutContainer').style.display = 'none';
            document.getElementById('shelterContainer').style.display = 'inline';
			document.getElementById('mountainContainer').style.display = 'none';
    };
		function showMountains() {
            document.getElementById('hutContainer').style.display = 'none';
            document.getElementById('shelterContainer').style.display = 'none';
			document.getElementById('mountainContainer').style.display = 'inline';
    }
			</script>
			<body>
				<h1 class="title">Каталог на хижите в България</h1>
				<button class="button" onclick="showHuts();">
			Хижи
				</button>
				<button class="button" onclick="showShelters()">
			Заслони
				</button>
				<button class="button" onclick="showMountains()">
			Планини
				</button>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>


	<xsl:template match="/hutsInBG/hutsList">
		<div id="hutContainer">
			<xsl:for-each select="/hutsInBG/hutsList/hut/hutInformation[id &lt; 11]">
				<xsl:sort
					select = "name" data-type="text"
					order = "ascending">
				</xsl:sort>

				<div style="color:white;" class="main-container">

					<div class="img">
						<img src="images/{id}.jpg"/>
					</div>

					<div class="infoPanel">
						<p id="hutName" class="name">
							<xsl:value-of select="name"/>
						</p>
						<div class="info">
							<div id="hutInfo">
								<p id="label">Планина</p>
								<p>
									<xsl:value-of select="mountain"/>
								</p>
								<p id="label">Капацитет</p>
								<p>
									<xsl:value-of select="capacity"/>
								</p>
							</div>
							<div id="hutCoordinates">
								<p id="label">Надморска височина</p>
								<p>
									<xsl:value-of select="altitude"/>
								</p>
								<p id="label">GPS координати</p>
								<p>
									<xsl:value-of select="GPScoordinates"/>
								</p>
							</div>
							<div id="extraHutInfo">
								<p id="label">Тел</p>
								<p>
									<xsl:value-of select="telephone"/>
								</p>
								<p id="label">Сайт</p>
								<a href="{site/@href}">
									<xsl:value-of select="site"/>
								</a>
							</div>
							<div class="dropdown">
								<p id="label">Наблизо</p>
								<div class="dropdown-content">
									<xsl:for-each select="../nearbyList/nearby">
										<p id="faculty">
											<xsl:value-of select="."/>
										</p>
									</xsl:for-each>
								</div>
							</div>
						</div>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="/hutsInBG/shelterList">
		<div id="shelterContainer" class="main-container" style="display:none;">
			<xsl:for-each select="/hutsInBG/shelterList/shelter/shelterInformation[id &lt; 34]">
				<xsl:sort
					select = "name" data-type="text"
					order = "ascending">
				</xsl:sort>
				<div style="color:white;" class="shelter">

					<img src="images/{id}.jpg"/>

					<p id="shelterName">
						<xsl:value-of select="name"/>
					</p>

					<div id="shelterInfo">
						<p id="label">Планина</p>
						<p>
							<xsl:value-of select="mountain"/>
						</p>
						<p id="label">Сайт</p>
						<a href="{site/@href}">
							<xsl:value-of select="site"/>
						</a>
					</div>
					<div id="shelterCoordinates">
						<p id="label">Надморска височина</p>
						<p>
							<xsl:value-of select="altitude"/>
						</p>
						<p id="label">GPS координати</p>
						<p>
							<xsl:value-of select="GPScoordinates"/>
						</p>
					</div>
					<div class="dropdown">
						<p id="label">Наблизо</p>
						<div class="dropdown-content">
							<xsl:for-each select="../nearbyList/nearby">
								<p id="nearby">
									<xsl:value-of select="."/>
								</p>
							</xsl:for-each>
						</div>
					</div>

				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="/hutsInBG/mountainList">
		<div id="mountainContainer" class="main-container" style="display:none;">
			<xsl:for-each select="/hutsInBG/mountainList/mountainInfo">
				<xsl:variable name="rName">
					<xsl:value-of select="mountainName"/>
				</xsl:variable>
				<xsl:variable name="rId">
					<xsl:value-of select="moun/@mounIdRef"/>
				</xsl:variable>

				<div style="color:white;" class="mountain">

					<p id="mountainLabel">
						<xsl:value-of select="mountainName"/>
					</p>
					<div>
						<xsl:for-each select="/hutsInBG/hutsList/hut/hutInformation[mountainId = $rId]">
							<div style="color:white;" class="specialMountain">
								<img src="images/{id}.jpg"/>
								<div id="mounInfo">
									<p id="hutName">
										<xsl:value-of select="name"/>
									</p>
									<p id="label">Капацитет</p>
									<p>
										<xsl:value-of select="capacity"/>
									</p>
									<p id="label">Тел</p>
									<p>
										<xsl:value-of select="telephone"/>
									</p>
								</div>
								<div id="hutContacts">
									<p id="label">Надморска височина</p>
									<p>
										<xsl:value-of select="altitude"/>
									</p>
									<p id="label">GPS координати</p>
									<p>
										<xsl:value-of select="GPScoordinates"/>
									</p>
									<p id="label">Сайт</p>
									<a href="{site/@href}">
										<xsl:value-of select="site"/>
									</a>
								</div>
								<div class="dropdown">
									<p id="label">Наблизо</p>
									<div class="dropdown-content">
										<xsl:for-each select="../nearbyList/nearby">
											<p id="nearby">
												<xsl:value-of select="."/>
											</p>
										</xsl:for-each>
									</div>
								</div>
							</div>
						</xsl:for-each>
						<xsl:for-each select="/hutsInBG/shelterList/shelter/shelterInformation[mountainId = $rId]">

							<div style="color:white;" class="specialMountain">

								<img src="images/{id}.jpg"/>


								<div id="mounInfoShelter">
									<p id="shelterName">
										<xsl:value-of select="name"/>
									</p>
									<p id="label">Сайт</p>
									<a href="{site/@href}">
										<xsl:value-of select="site"/>
									</a>

								</div>
								<div id="hutContactsShelter">
									<p id="label">Надморска височина</p>
									<p>
										<xsl:value-of select="altitude"/>
									</p>

									<p id="label">GPS координати</p>
									<p>
										<xsl:value-of select="GPScoordinates"/>
									</p>



								</div>

								<div class="dropdown">
									<p id="label">Наблизо</p>
									<div class="dropdown-content">
										<xsl:for-each select="../nearbyList/nearby">
											<p id="nearby">
												<xsl:value-of select="."/>
											</p>
										</xsl:for-each>
									</div>
								</div>
							</div>

						</xsl:for-each>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

</xsl:stylesheet>