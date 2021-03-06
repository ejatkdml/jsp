<%@page import="bean.CountBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="webnovel.MainMgr" />
<%
	request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>웹소설 데이터베이스 | wndb</title>
<script>
	
</script>
<base href="http://localhost:8080/webnovel/" />
<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/wndb.css" type="text/css" media="all" />

<meta property="og:description"
	content="VNDB.org strives to be a comprehensive database for information about visual novels." />
<meta property="og:image" content="https://s.vndb.org/s/angel/bg.jpg" />
<meta property="og:site_name" content="The Visual Novel Database" />
<meta property="og:title" content="The Visual Novel Database" />
<meta property="og:type" content="website" />
<meta property="og:url" content="https://vndb.org/" />
</head>
<body>
	<div id="bgright"></div>
	<div id="header">
		<h1>
			<a href="/">웹소설 데이터베이스</a>
		</h1>
	</div>
	<div id="menulist">
		<div class="menubox">
			<h2>Menu</h2>
			<div>
				<a href="./wndb.html">Home</a><br /> <a href="/v/all">웹소설</a><br />
				<b class="grayedout">> </b><a href="/g">태그</a><br /> <a href="/r">작가</a><br />
				<a href="/p/all">연재처</a><br /> <a href="/s/all">출판사</a><br /> <a
					href="/c/all">등장인물</a><br /> <b class="grayedout">> </b><a
					href="/i">특징</a><br /> <a href="/u/all">유저</a><br /> <a
					href="/hist">최근 변화</a><br /> <a href="/t">토론판</a><br /> <a
					href="/d6">FAQ</a><br /> <a href="/v/rand">랜덤 웹소설</a><br />
			</div>
			<form action="/v/all" method="get" id="search">
				<fieldset>
					<legend>Search</legend>
					<input type="text" class="text" id="sq" name="sq" value=""
						placeholder="search" /><input type="submit" class="submit"
						value="Search" />
				</fieldset>
			</form>
		</div>
		<div class="menubox">
			<h2>유저 메뉴</h2>
			<div>
				<a href="./u/login">로그인</a><br /> <a href="./u/newpass">비밀번호 변경</a><br />
				<a href="./u/register">회원가입</a><br />
			</div>
		</div>
		<div class="menubox">
			<h2>Database Statistics</h2>
			<div>
				<dl>
					<%
						CountBean countbean = new CountBean();
					countbean = mgr.DataCount();
					%>
					<dt>웹소설</dt>
					<dd>
						<%
							countbean.getNovelcnt();
						%>
					</dd>
					<dt>
						<b class="grayedout">> </b>태그
					</dt>
					<dd>
						<%
							countbean.getTagcnt();
						%>
					</dd>
					<dt>작가</dt>
					<dd>
						<%
							countbean.getAuthorcnt();
						%>
					</dd>
					<dt>연재처</dt>
					<dd><%
							countbean.getWebcnt();
						%></dd>
					<dt>출판사</dt>
					<dd><%
							countbean.getPubcnt();
						%></dd>
					<dt>등장인물</dt>
					<dd><%
							countbean.getCharactercnt();
						%></dd>
					<dt>
						<b class="grayedout">> </b>특성
					</dt>
					<dd><%
							countbean.getTraitcnt();
						%></dd>
				</dl>
				<div class="clearfloat"></div>
			</div>
		</div>
	</div>
	<div id="maincontent">
		<div class="mainbox">
			<h1>웹소설 데이터베이스</h1>
			<p class="description">
				웹소설 데이터베이스는 웹소설에 대한 각종 정보를 모아두는 홈페이지입니다. <br /> 이 홈페이지는 위키로
				만들어졌습니다. 여러분들의 참여를 통해서 보다 풍성한 자료를 지닌 사이트로 거듭날 수 있습니다.
			</p>
		</div>
		<div class="homepage threelayout">
			<div>
				<h1>
					<a href="/hist">최근 변화</a> <a href="/feeds/changes.atom"><abbr
						class="icons feed" title="Atom Feed"></abbr></a>
				</h1>
				<ul>
					<!-- <li><span>r:<a href="/r67011.2" title="Aquadine - Demo">Aquadine
								- Demo</a></span><span> by <a href="/u54156">trickzzter</a></span></li>
					<li><span>r:<a href="/r14002.3"
							title="Muv-Luv Alternative - Total Eclipse - Trial Edition">Muv-Luv
								Alternative - Total Eclipse - Trial Edition</a></span><span> by <a
							href="/u124775">fuukanou</a></span></li>
					<li><span>v:<a href="/v24803.51" title="月の彼方で逢いましょう">Tsuki
								no Kanata de Aimashou</a></span><span> by <a href="/u38247">vario</a></span></li>
					<li><span>v:<a href="/v29445.4" title="Loopers">Loopers</a></span><span>
							by <a href="/u38247">vario</a>
					</span></li>
					<li><span>s:<a href="/s22596.1" title="高田 和磨">Takada
								Kazuma​</a></span><span> by <a href="/u38247">vario</a></span></li>
					<li><span>r:<a href="/r75307.3" title="Loopers">Loopers</a></span><span>
							by <a href="/u38247">vario</a>
					</span></li>
					<li><span>v:<a href="/v29445.3" title="Loopers">Loopers</a></span><span>
							by <a href="/u38247">vario</a>
					</span></li>
					<li><span>v:<a href="/v29445.2" title="Looper">Looper</a></span><span>
							by <a href="/u38247">vario</a>
					</span></li>
					<li><span>r:<a href="/r61316.2" title="互相触碰～娇惯满是伤痕的少女">Fureai
								~Kizu Darake no Shoujo o Amayakasu~</a></span><span> by <a
							href="/u87924">jazz957</a></span></li>
					<li><span>r:<a href="/r56526.2" title="ユニオリズム・カルテット">Unionism
								Quartet</a></span><span> by <a href="/u87924">jazz957</a></span></li> -->
				</ul>
			</div>
			<div>
				<p class="mainopts">
					<a href="/t/an">Announcements</a><b class="grayedout">&amp;</b><a
						href="/t/db">VNDB</a>
				</p>
				<h1>DB Discussions</h1>
				<ul>
					<!-- <li><span>38 min ago <a href="/t14995.40#last"
							title="Posted in VNDB discussions">Advanced search: (too)
								early testing &amp; feedback</a></span><span> by <a href="/u55140">rampaa</a></span></li>
					<li><span>7 hours ago <a href="/t8242.368#last"
							title="Posted in VNDB discussions">The how to edit thread</a></span><span>
							by <a href="/u4762">beliar</a>
					</span></li>
					<li><span>12 hours ago <a href="/t950.869#last"
							title="Posted in VNDB discussions">VNDB Suggestions!</a></span><span>
							by <a href="/u2">yorhel</a>
					</span></li>
					<li><span>29 hours ago <a href="/t2108.3456#last"
							title="Posted in VNDB discussions">Candidates for deletion</a></span><span>
							by <a href="/u10428">butterflygrrl</a>
					</span></li>
					<li><span>35 hours ago <a href="/t2520.525#last"
							title="Posted in VNDB discussions">Minor error/s</a></span><span>
							by <a href="/u2">yorhel</a>
					</span></li>
					<li><span>37 hours ago <a href="/t14639.160#last"
							title="Posted in Announcements">Reviews in Preview</a></span><span>
							by <a href="/u28602">mrkew</a>
					</span></li>
					<li><span>2 days ago <a href="/t3599.241#last"
							title="Posted in Announcements">Some love for the API</a></span><span>
							by <a href="/u2">yorhel</a>
					</span></li>
					<li><span>5 days ago <a href="/t15139.1#last"
							title="Posted in VNDB discussions">Mass tagging request</a></span><span>
							by <a href="/u55140">rampaa</a>
					</span></li>
					<li><span>5 days ago <a href="/t3314.2372#last"
							title="Posted in VNDB discussions">Traits</a></span><span> by <a
							href="/u23547">barfboy</a></span></li>
					<li><span>8 days ago <a href="/t15116.4#last"
							title="Posted in VNDB discussions">Tag for H-scene
								alternatives?</a></span><span> by <a href="/u151724">fllthdcrb</a></span></li> -->
				</ul>
			</div>
			<div>
				<p class="mainopts">
					<a href="/t/all">Forums</a><b class="grayedout">&amp;</b><a
						href="/w?o=d&amp;s=lastpost">Reviews</a>
				</p>
				<h1>
					<a href="/t/all">VN Discussions</a>
				</h1>
				<ul>
					<li><span>15 min ago <a href="/t15169.3#last"
							title="Posted in Visual novels > Muv-Luv Alternative - Total Eclipse">Why
								is this +18 rated?</a></span><span> by <a href="/u186639">kfethemusician</a></span></li>
					<li><span>41 min ago <a href="/t15013.23#last"
							title="Posted in Visual novels > Summer Pockets">Misaki
								kyouko role?</a></span><span> by <a href="/u164335">shirokuza</a></span></li>
					<li><span>2 hours ago <a href="/w107.1#last"
							title="Review">Dustmania Grotesque ~Kaitai Sounyuu Shinsho~</a></span><span>
							by <a href="/u187516">milfenjoyer</a>
					</span></li>
					<li><span>2 hours ago <a href="/t15130.12#last"
							title="Posted in General discussions">Hata's December
								calendar - 24 Reviews in 24 Days?</a></span><span> by <a
							href="/u154024">vninfohata</a></span></li>
					<li><span>4 hours ago <a href="/t14009.9#last"
							title="Posted in Visual novels > Tenshin Ranman Lucky or Unlucky!?">Sekai
								Project woe?</a></span><span> by <a href="/u134918">kingking00</a></span></li>
					<li><span>6 hours ago <a href="/t15166.5#last"
							title="Posted in Visual novels > Sakura no Uta -Sakura no Mori no Ue o Mau-">Why
								do people like this?</a></span><span> by <a href="/u181566">shikishimakrile</a></span></li>
					<li><span>7 hours ago <a href="/t15159.5#last"
							title="Posted in Visual novels > Saki no Love Love Honeymoon">Shouldn't
								it be considered Fandisc, not sequel?</a></span><span> by <a
							href="/u145694">adamstan</a></span></li>
					<li><span>7 hours ago <a href="/w1025.9#last"
							title="Review">Dasaku</a></span><span> by <a href="/u173667">saolzboi98</a></span></li>
					<li><span>7 hours ago <a href="/t15165.7#last"
							title="Posted in Visual novels > Daitoshokan no Hitsujikai">(Spoiler)
								Nagi is...?</a></span><span> by <a href="/u112528">diabloryuzaki</a></span></li>
					<li><span>7 hours ago <a href="/t15168.2#last"
							title="Posted in Visual novels > Irotoridori no Sekai">Official
								English release/s</a></span><span> by <a href="/u112528">diabloryuzaki</a></span></li>
				</ul>
			</div>
		</div>
		<div class="homepage threelayout">
			<div>
				<h1>
					<a href="/w">Latest Reviews</a>
				</h1>
				<ul>
					<li><span>4 hours ago <b class="grayedout"> Mini </b><a
							href="/w1138" title="Imouto no Okage de Motesugite Yabai.">Imouto
								no Okage de Motesugite Yabai.</a></span><span>by <a href="/u23547">barfboy</a></span></li>
					<li><span>7 hours ago <b class="grayedout"> Full </b><a
							href="/w1137" title="Minikiss ~Tsuyokiss Fan Disc~">Minikiss
								~Tsuyokiss Fan Disc~</a></span><span>by <a href="/u135571">onorub</a></span></li>
					<li><span>7 hours ago <b class="grayedout"> Mini </b><a
							href="/w1136" title="Dasaku">Dasaku</a></span><span>by <a
							href="/u173667">saolzboi98</a></span></li>
					<li><span>9 hours ago <b class="grayedout"> Full </b><a
							href="/w1135" title="Rei-Jin-G-Lu-P">Rei-Jin-G-Lu-P</a></span><span>by
							<a href="/u16480">kuroonehalf</a>
					</span></li>
					<li><span>27 hours ago <b class="grayedout"> Mini </b><a
							href="/w1134" title="Princess Frontier">Princess Frontier</a></span><span>by
							<a href="/u135571">onorub</a>
					</span></li>
					<li><span>33 hours ago <b class="grayedout"> Full </b><a
							href="/w1133"
							title="Shin Onna Kyoushi Yuuwaku Shinro Shidoushitsu">Shin
								Onna Kyoushi Yuuwaku Shinro Shidoushitsu</a></span><span>by <a
							href="/u174058">duk</a></span></li>
					<li><span>34 hours ago <b class="grayedout"> Mini </b><a
							href="/w1132" title="Who is Mike?">Who is Mike?</a></span><span>by
							<a href="/u153726">psm3l0</a>
					</span></li>
					<li><span>34 hours ago <b class="grayedout"> Full </b><a
							href="/w1131" title="Steins;Gate Hiyoku Renri no Darling">Steins;Gate
								Hiyoku Renri no Darling</a></span><span>by <a href="/u153726">psm3l0</a></span></li>
					<li><span>38 hours ago <b class="grayedout"> Full </b><a
							href="/w1130" title="Rance 02 Kai - Hangyaku no Shoujo-tachi -">Rance
								02 Kai - Hangyaku no Shoujo-tachi -</a></span><span>by <a
							href="/u141152">mikiru</a></span></li>
					<li><span>42 hours ago <b class="grayedout"> Mini </b><a
							href="/w1129"
							title="Miraeui Yeochinnimi Naege Insareul Geonnewatda">Miraeui
								Yeochinnimi Naege Insareul Geonnewatda</a></span><span>by <a
							href="/u24999">swordfish96</a></span></li>
				</ul>
			</div>
			<div>
				<h1>
					<a href="/r?fil=released-0;o=a;s=released">Upcoming Releases</a>
				</h1>
				<ul>
					<li><span><b class="future">2020-12-14</b> <abbr
							class="icons ios" title="Apple iProduct"></abbr><abbr
							class="icons and" title="Android"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r75941"
							title="Professional Boyfriend">Professional Boyfriend</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang zh" title="Chinese"></abbr> <a href="/r57752"
							title="I Walk Among Zombies Vol. 3 - Steam Edition">I Walk
								Among Zombies Vol. 3 - Steam Edition</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r57753"
							title="I Walk Among Zombies Vol. 0 - Steam Edition">I Walk
								Among Zombies Vol. 0 - Steam Edition</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang zh" title="Chinese"></abbr> <a href="/r64746"
							title="The Ditzy Demons Are in Love With Me - Fandisc">The
								Ditzy Demons Are in Love With Me - Fandisc</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang zh" title="Chinese"></abbr> <a href="/r75924"
							title="The Ditzy Demons Are in Love With Me - Fandisc - 18+ Edition">The
								Ditzy Demons Are in Love With Me - Fandisc - 18+ Edition</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang ja" title="Japanese"></abbr><abbr
							class="icons lang zh" title="Chinese"></abbr> <a href="/r76023"
							title="Fantasy Tavern Sextet -Vol.1 New World Days～">Fantasy
								Tavern Sextet -Vol.1 New World Days～</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r76121"
							title="I Walk Among Zombies Vol. 0 - 18+ Edition">I Walk
								Among Zombies Vol. 0 - 18+ Edition</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r76122"
							title="I Walk Among Zombies Vol. 0 - 18+ DLC">I Walk Among
								Zombies Vol. 0 - 18+ DLC</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r76123"
							title="I Walk Among Zombies Vol. 3 - 18+ Edition">I Walk
								Among Zombies Vol. 3 - 18+ Edition</a></span></li>
					<li><span><b class="future">2020-12-15</b> <abbr
							class="icons win" title="Windows"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang zh" title="Chinese"></abbr> <a href="/r76124"
							title="I Walk Among Zombies Vol. 3 - 18+ DLC">I Walk Among
								Zombies Vol. 3 - 18+ DLC</a></span></li>
				</ul>
			</div>
			<div>
				<h1>
					<a href="/r?fil=released-1;o=d;s=released">Just Released</a>
				</h1>
				<ul>
					<li><span>2020-12-11 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lang ja"
							title="Japanese"></abbr> <a href="/r76283"
							title="孤独な猫少女を拾って始まる、癒しの子作り生活 ダウンロード版">Kodoku na Neko Shoujo
								o Hirotte Hajimaru, Iyashi no Kozukuri Seikatsu - Download
								Edition</a></span></li>
					<li><span>2020-12-10 <abbr class="icons swi"
							title="Nintendo Switch"></abbr><abbr class="icons lang ja"
							title="Japanese"></abbr> <a href="/r67341"
							title="ひめひび Another Princess Days – White or Black –">Himehibi
								Another Princess Days -White or Black-</a></span></li>
					<li><span>2020-12-10 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r75297"
							title="Oath of Loyalty v0.6">Oath of Loyalty v0.6</a></span></li>
					<li><span>2020-12-10 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang de" title="German"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang es" title="Spanish"></abbr><abbr
							class="icons lang ja" title="Japanese"></abbr><abbr
							class="icons lang ko" title="Korean"></abbr><abbr
							class="icons lang pt-br" title="Portuguese (Brazil)"></abbr> <a
							href="/r76325" title="spring leaves no flowers">spring leaves
								no flowers</a></span></li>
					<li><span>2020-12-09 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r51825"
							title="Kingdom of Deception v0.11">Kingdom of Deception v0.11</a></span></li>
					<li><span>2020-12-09 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang de" title="German"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang es" title="Spanish"></abbr><abbr
							class="icons lang fr" title="French"></abbr> <a href="/r75761"
							title="Elsaverse: Transitions: Episodes 1-2">Elsaverse:
								Transitions: Episodes 1-2</a></span></li>
					<li><span>2020-12-09 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lang ja"
							title="Japanese"></abbr> <a href="/r76024" title="天ノ少女 プロローグ">Kara
								no Shoujo - The Last Episode prologue</a></span></li>
					<li><span>2020-12-08 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang en" title="English"></abbr> <a href="/r75021"
							title="Lewd Island: Season 2 (Day 11 v1.1)">Lewd Island:
								Season 2 (Day 11 v1.1)</a></span></li>
					<li><span>2020-12-08 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang ru" title="Russian"></abbr> <a href="/r75176"
							title="Succubus Contract v0.7.2">Succubus Contract v0.7.2</a></span></li>
					<li><span>2020-12-08 <abbr class="icons win"
							title="Windows"></abbr><abbr class="icons lin" title="Linux"></abbr><abbr
							class="icons mac" title="Mac OS"></abbr><abbr
							class="icons lang en" title="English"></abbr><abbr
							class="icons lang es" title="Spanish"></abbr><abbr
							class="icons lang fr" title="French"></abbr> <a href="/r76173"
							title="The Hayseed Knight">The Hayseed Knight</a></span></li>
				</ul>
			</div>
		</div>
		<div id="footer">
			"<a href="/v646" style="text-decoration: none">And the moment
				when you actually came, did that happen to be inside, or perchance
				outside?</a>&quot;<br /> <a href="https://code.blicky.net/yorhel/vndb">2.28-164</a>
			| <a href="/d7">about us</a> | <a href="irc://irc.synirc.net/vndb">#vndb</a>
			| <a href="mailto:contact@vndb.org">contact@vndb.org</a>
		</div>
	</div>
</body>
</html>