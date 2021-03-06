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
			document.getElementById('hutContainer').style.display = 'grid';
            document.getElementById('shelterContainer').style.display = 'none'
			document.getElementById('mountainContainer').style.display = 'none'
    };
		function showShelters() {
            document.getElementById('hutContainer').style.display = 'none'
            document.getElementById('shelterContainer').style.display = 'grid';
			document.getElementById('mountainContainer').style.display = 'none'
    };
		function showMountains() {
            document.getElementById('hutContainer').style.display = 'none'
            document.getElementById('shelterContainer').style.display = 'none'
			document.getElementById('mountainContainer').style.display = 'grid';
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
		<div class="grid" id="hutContainer">
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
							<div class="text-box" id="hutInfo">
								<p id="label">Планина</p>
								<p>
									<xsl:value-of select="mountain"/>
								</p>
								<p id="label">Капацитет</p>
								<p class="delim-line">
									<xsl:value-of select="capacity"/>
								</p>
							</div>
							<div class="text-box" id="hutCoordinates">
								<p id="label">Надморска височина</p>
								<p>
									<xsl:value-of select="altitude"/>
								</p>
								<p id="label">GPS координати</p>
								<p class="delim-line">
									<xsl:value-of select="GPScoordinates"/>
								</p>
							</div>
							<div class="text-box" id="extraHutInfo">
								<p id="label">Тел</p>
								<p>
									<xsl:value-of select="telephone"/>
								</p>
								<p id="label">Сайт</p>
								<a class="delim-line" href="{site/@href}">
									<xsl:value-of select="site"/>
								</a>
							</div>
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
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="/hutsInBG/shelterList">
		<div class="grid" id="shelterContainer">
			<xsl:for-each select="/hutsInBG/shelterList/shelter/shelterInformation[id &lt; 34]">
				<xsl:sort
					select = "name" data-type="text"
					order = "ascending">
				</xsl:sort>
				<div class="main-container">
					<div class="img">
						<img src="images/{id}.jpg"/>
					</div>
					<div class="infoPanel">
						<p id="shelterName" class="name">
							<xsl:value-of select="name"/>
						</p>
						<div class="info">
							<div class="text-box" id="shelterInfo">
								<p id="label">Планина</p>
								<p>
									<xsl:value-of select="mountain"/>
								</p>
								<p id="label">Сайт</p>
								<a href="{site/@href}">
									<xsl:value-of select="site"/>
								</a>
							</div>
							<div class="text-box" id="shelterCoordinates">
								<p id="label">Надморска височина</p>
								<p>
									<xsl:value-of select="altitude"/>
								</p>
								<p id="label">GPS координати</p>
								<p>
									<xsl:value-of select="GPScoordinates"/>
								</p>
							</div>
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
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="/hutsInBG/mountainList">
		<div class="grid" id="mountainContainer">
			<xsl:for-each select="/hutsInBG/mountainList/mountainInfo">
				<xsl:variable name="rName">
					<xsl:value-of select="mountainName"/>
				</xsl:variable>
				<xsl:variable name="rId">
					<xsl:value-of select="moun/@mounIdRef"/>
				</xsl:variable>
				<div style="color:white;" class="main-container2">
					<p class="name2" id="mountainLabel">
						<xsl:value-of select="mountainName"/>
					</p>
					<div>
						<xsl:for-each select="/hutsInBG/hutsList/hut/hutInformation[mountainId = $rId]">
							<div style="color:white;" class="semi-main2">
								<div class="img">
									<img src="images/{id}.jpg"/>
								</div>
								<div class="idk-anymore">
									<p id="hutName" class="name">
										<xsl:value-of select="name"/>
									</p>
									<div class="info2">
										<div id="mounInfo">
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
							</div>
						</xsl:for-each>
						<xsl:for-each select="/hutsInBG/shelterList/shelter/shelterInformation[mountainId = $rId]">
							<div style="color:white;" class="semi-main2">
								<div class="img">
									<img src="images/{id}.jpg"/>
								</div>
								<div class="idk-anymore">
									<p id="shelterName" class="name">
										<xsl:value-of select="name"/>
									</p>
									<div class="info2">
										<div id="mounInfoShelter">
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
							</div>
						</xsl:for-each>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

</xsl:stylesheet>