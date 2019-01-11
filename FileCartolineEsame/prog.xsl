<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <link href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro|Zilla+Slab" rel="stylesheet"/> 
                <link rel="stylesheet" type="text/css" href="stile.css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="main.js" charset="utf-8"> </script>
                <script src="gallery.js" charset="utf-8"> </script>
                <script src="https://cdn.jsdelivr.net/lodash/4.17.2/lodash.min.js"></script>
            </head>
            <body>
                
                <h1>Cartoline ad Oliva</h1>
                
                <div id="descr">
                    <p>In questa pagina sono presentate digitalmente, dopo essere state codificate, tre cartoline appartenenti ad una collezione di 227 cartoline attualmente presenti al 
                    Museo Civico Etnografico "Giovanni Podenzana" presso La Spezia. Queste sono identificabili nella pagina tramite il loro numero di catalogazione e sono rispettivamente:</p>
                    <p>- Cartolina n°067: Inviata da Ravenna da parte di Giuseppe ad Arona per la signorina Oliva Turtura.</p>
                    <p>- Cartolina n°187: Inviata da Spezia da parte di Giovanni Coliola alla signorina Oliva Turtura</p>
                    <p>- Cartolina n°197: Inviata da Modena da parte di Giovanni Coliola alla signorina Oliva Turtura</p>
                </div>
                <div id="accorgimenti">
                   <p>Per una migliore ed efficiente navigazione sulla pagina qua di seguito alcuni accorgimenti:</p>
                   <p> Cliccando sul menù a tendina è possibile scegliere la cartolina che si desidera visualizzare, di ognuna di esse è possibile scegliere il fronte o il retro tramite i due pulsanti soprastanti l'immagine.
                    Per una migliore lettura del testo, è stato inserito un collegamento testo-immagine, per cui spostando il puntatore su una frase presente nell'immagine si colorerà una freccetta che indicherà il corrispettivo testo.
                    Sul lato destro sono inoltre presenti due pulsanti: uno per la galleria e uno per ulteriori informazioni. Cliccando su quest'ultimo sarà possibile avere maggiore informazioni 
                    sulle cartoline, sulle persone e sui luoghi citati nella cartolina.</p>
                </div>

           <xsl:element name="div">
               <xsl:attribute name="id">box</xsl:attribute>
               <!--PULSANTI CARTOLINE-->
               <div id="buttons">
                   <select id="pulsanti">
                       <option id="p187" class="Cartolina" name="Cartolina" value="Cart1" selected="selected">067</option> 
                       <option id="p067" class="Cartolina" name="Cartolina" value="Cart2">187</option> 
                       <option id="p197" class="Cartolina" name="Cartolina" value="Cart3">197</option>  
                   </select>
               <!--PULSANTI FRONTE RETRO-->
                   <p id="pRadio">FRONTE<input type="radio" id="radio1" name="radioPie" value="Fronte" checked="checked"/>
                   RETRO<input type="radio" id="radio2" name="radioPie" value="Retro"/></p>
               </div>
               <!--PULSANTE INFO-->
               <input type="button" value="GALLERIA CARTOLINE" id="button2" />
               <input type="button" value="ALTRE INFORMAZIONI" id="button" />
               
               <!--FRONTE-->
               
                   <xsl:if test="//tei:surface[position()=1]/translate(@corresp, '#', '')=//tei:text/tei:body/tei:div[position()=1]/@xml:id">
                        <xsl:for-each select="//tei:surface[position()=1]/tei:graphic">
                            <xsl:element name="div">
                                <xsl:attribute name="class">divimgcod</xsl:attribute>
                                <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                <xsl:element name="div">
                                     <xsl:attribute name="class">divImmagine</xsl:attribute>
                                     <xsl:element name="img">
                                          <xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute>
                                          <xsl:attribute name="id"><xsl:value-of select="translate(@url, 'img/.jpg', 'C')"/></xsl:attribute>
                                         <xsl:attribute name="usemap">#Map1</xsl:attribute>
                                     </xsl:element>
                                 </xsl:element>
                                 <xsl:element name="div">
                                     <xsl:attribute name="class">boxcod</xsl:attribute>
                                             
                                     <xsl:element name="div">
                                         <xsl:attribute name="id">div_fronte</xsl:attribute>
                                         <xsl:if test="@xml:id='fronte1'">
                                             <table class="table_fronte">
                                                 <tr>
                                                     <td class="td_1">TITOLO DELLA CARTOLINA</td>
                                                     <td class="td_2"><em><xsl:value-of select="/teiCorpus/TEI[1]/tei:text/tei:body/tei:div/tei:figure/tei:head"/></em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1">AUTORE</td>
                                                     <td class="td_2"><em><xsl:apply-templates select="/teiCorpus/TEI[1]/tei:text/tei:body/tei:div/tei:ab/tei:persName[@ref='#M']"/></em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1">DESCRIZIONE</td>
                                                     <td class="td_2"><xsl:value-of select="/teiCorpus/TEI[1]/tei:text/tei:body/tei:div/tei:figure/tei:figDesc"/></td>
                                                 </tr>
                                             </table>
                                             <br/>
                                             <p>Sul fronte della cartolina troviamo riportate le scritte:</p>  
                                             <p style="text-align:center;">"<b><xsl:apply-templates select="/teiCorpus/TEI[1]/tei:text/tei:front/tei:div/tei:ab[@xml:id='ScritteF1']"/></b>"</p> 
                                             <p>Qui di seguito la loro spiegazione:<br/>
                                                 <b>219</b>: l'immagine appartiene all'allegoria n°219<br/> 
                                                 <b>A.N.</b>: pubblicatore dell'opera (Alfred Noyer)<br/>
                                                 <b>Paris</b>: luogo di pubblicazione<br/>
                                                 <b>D. Mastroianni</b>: autore dell'opera (Domenico Mastroianni)<br/>
                                                 <b>Sommeil Interrompu</b>: titolo dell'opera<br/>
                                                 Per ulteriori informazioni sull'autore, cliccare prima su <em>ALTRE INFORMAZIONI</em> ed in seguito sul link annesso al suo nome nella sezione <em>Persone</em>.
                                             </p>
                                         </xsl:if>
                                         <xsl:if test="@xml:id='fronte2'">
                                             <table class="table_fronte">
                                                 <tr>
                                                     <td class="td_1">TITOLO DELLA CARTOLINA</td>
                                                     <td class="td_2"><em><xsl:value-of select="/teiCorpus/TEI[2]/tei:text/tei:body/tei:div/tei:figure/tei:head"/></em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1">AUTORE</td>
                                                     <td class="td_2"><em><xsl:apply-templates select="/teiCorpus/TEI[2]/tei:text/tei:body/tei:div/tei:ab/tei:persName[@ref='#M']"/></em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1">DESCRIZIONE</td>
                                                     <td class="td_2"><xsl:value-of select="/teiCorpus/TEI[2]/tei:text/tei:body/tei:div/tei:figure/tei:figDesc"/></td>
                                                 </tr>
                                             </table>
                                             <br/>
                                             <p>
                                                 Sul limite inferiore sinistro della cartolina troviamo la firma dell'autore dell'opera: <br/> 
                                                 <b>"<xsl:value-of select="/teiCorpus/TEI[2]/tei:text/tei:front/tei:div/tei:ab[@xml:id='ScritteF2']"/>"</b><br/><br/>
                                                 Si tratta di Domenico Mastroianni. Per ulteriori informazioni sull'autore, cliccare prima su <em>ALTRE INFORMAZIONI</em> ed in seguito sul link annesso al suo nome nella sezione <em>Persone</em>.
                                             </p>
                                         </xsl:if>
                                         <xsl:if test="@xml:id='fronte3'">
                                             <table class="table_fronte">
                                                 <tr>
                                                     <td class="td_1">TITOLO DELLA CARTOLINA</td>
                                                     <td class="td_2"><em><xsl:value-of select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:figure/tei:head"/></em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1">AUTORE</td>
                                                     <td class="td_2"><em><xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:ab/tei:persName"/></em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1"><br/>TESTO</td>
                                                     <td class="td_2"><em>
                                                         <xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:salute"/>
                                                         <xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:signed"/>
                                                         <xsl:element name="map">
                                                             <xsl:attribute name="name">Map1</xsl:attribute>
                                                             <xsl:attribute name="class">Map</xsl:attribute>
                                                             <xsl:apply-templates select="//TEI[@n='3']/tei:facsimile/tei:surface/tei:zone"/>
                                                         </xsl:element>
                                                      </em></td>
                                                 </tr>
                                                 <tr>
                                                     <td class="td_1">DESCRIZIONE</td>
                                                     <td class="td_2"><xsl:value-of select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:figure/tei:figDesc"/></td>
                                                 </tr>
                                             </table>
                                             
                                             <p>
                                                 Sul limite inferiore destro della cartolina, troviamo, anche se quasi illeggibile, la firma dell'autore dell'opera: <br/><b>"<xsl:value-of select="/teiCorpus/TEI[3]/tei:text/tei:front/tei:div/tei:ab[@xml:id='ScritteF3']"/>"</b>.<br/>
                                                 Per ulteriori informazioni sull'autore, cliccare prima su <em>ALTRE INFORMAZIONI</em> ed in seguito sul link annesso al suo nome nella sezione <em>Persone</em>.
                                             </p>
                                         </xsl:if>
                                     </xsl:element>
                                 </xsl:element>
                             </xsl:element>
                         </xsl:for-each>
                    </xsl:if>
               
               <!--RETRO-->
                    
                    <xsl:if test="//tei:surface[position()=2]/translate(@corresp, '#', '')=//tei:text/tei:body/tei:div[position()=2]/@xml:id">
                        <xsl:for-each select="//tei:surface[position()=2]/tei:graphic">
                            <xsl:element name="div">
                                <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                <xsl:attribute name="class">divimgcod</xsl:attribute>
                                <xsl:element name="div">
                                    <xsl:attribute name="class">divImmagine</xsl:attribute>
                                    <xsl:element name="img">
                                        <xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute>
                                        <xsl:attribute name="id"><xsl:value-of select="translate(@url, 'img/.jpg', 'C')"/></xsl:attribute>
                                        <xsl:attribute name="class">Img</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="@url='img/067R.jpg'">
                                                <xsl:attribute name="usemap">#Map</xsl:attribute>
                                            </xsl:when>
                                            <xsl:when test="@url='img/187R.jpg'">
                                                <xsl:attribute name="usemap">#Map2</xsl:attribute>
                                            </xsl:when>
                                            <xsl:when test="@url='img/197R.jpg'">
                                                <xsl:attribute name="usemap">#Map3</xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                        
                                        
                                    </xsl:element>
                                    
                                    <xsl:choose>
                                        <xsl:when test="@xml:id='retro1'">
                                            <xsl:element name="map">
                                                <xsl:attribute name="name">Map</xsl:attribute>
                                                <xsl:attribute name="class">Map</xsl:attribute>
                                                <xsl:apply-templates select="//TEI[@n='1']/tei:facsimile/tei:surface/tei:zone"/>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:when test="@xml:id='retro2'">
                                            <xsl:element name="map">
                                                <xsl:attribute name="name">Map2</xsl:attribute>
                                                <xsl:attribute name="class">Map</xsl:attribute>
                                                <xsl:apply-templates select="//TEI[@n='2']/tei:facsimile/tei:surface/tei:zone"/>
                                            </xsl:element>
                                        </xsl:when>
                                        <xsl:when test="@xml:id='retro3'">
                                            <xsl:element name="map">
                                                <xsl:attribute name="name">Map3</xsl:attribute>
                                                <xsl:attribute name="class">Map</xsl:attribute>
                                                <xsl:apply-templates select="//TEI[@n='3']/tei:facsimile/tei:surface/tei:zone"/>
                                            </xsl:element>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:element>
                                
                                <xsl:element name="div">
                                    <xsl:attribute name="class">boxcod</xsl:attribute>
                                    
                                    <xsl:element name="div">
                                        <xsl:attribute name="id">div_retro</xsl:attribute>
                                        
                                        <xsl:if test="@xml:id='retro1'">
                                            <!--div per testo cartolina-->
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">text_retro1</xsl:attribute>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <em><xsl:apply-templates select="/teiCorpus/TEI[1]/tei:text/tei:body/tei:div/tei:div[@type='opener']"/></em>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:apply-templates select="//TEI[1]/tei:text/tei:body/tei:div/tei:div[@type='letter-body']"/>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:apply-templates select="/teiCorpus/TEI[1]/tei:text/tei:body/tei:div/tei:div[@type='closer']"/><br/>
                                                </xsl:element>
                                            </xsl:element>
                                            <!--div per francobolli cartolina-->
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">text_retro2</xsl:attribute>
                                                <xsl:element name="div">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:attribute name="id">p_francobolli</xsl:attribute>
                                                    <b>FRANCOBOLLI, TIMBRI E STAMPE</b><br/>
                                                    <xsl:for-each select="/teiCorpus/TEI[1]/tei:text/tei:front/tei:div/tei:p/tei:stamp/tei:mentioned">
                                                        <xsl:element name="p">
                                                            <xsl:attribute name="id"><xsl:value-of select='@xml:id'/></xsl:attribute>
                                                            <xsl:apply-templates select="."/>
                                                        </xsl:element>
                                                    </xsl:for-each>
                                                    <xsl:element name="p">
                                                        <xsl:attribute name="id"><xsl:value-of select="//tei:ab[@xml:id='ScritteR1']/tei:s/@xml:id"/></xsl:attribute>
                                                        <xsl:value-of select="/teiCorpus/TEI[1]/tei:text/tei:front/tei:div[position()=1]/tei:ab[@xml:id='ScritteR1']"/>
                                                        
                                                    </xsl:element>
                                                </xsl:element>
                                                <!--div per address cartolina-->
                                                <xsl:element name="div">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:attribute name="id">p_destination</xsl:attribute>
                                                    <xsl:for-each select="/teiCorpus/TEI[1]/tei:text/tei:body/tei:div/tei:div[@type='destination']/tei:p/tei:address/tei:addrLine">
                                                        <xsl:element name="p">
                                                            <xsl:attribute name="id"><xsl:value-of select='@xml:id'/></xsl:attribute>
                                                            <em><u><xsl:apply-templates select="."/></u></em>
                                                        </xsl:element>
                                                    </xsl:for-each>
                                                </xsl:element>
                                                
                                            </xsl:element>
                                            
                                        </xsl:if>

                                        <xsl:if test="@xml:id='retro2'">  

                                            <!--div testo cartolina-->
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">text_retro1</xsl:attribute>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <em><xsl:apply-templates select="/teiCorpus/TEI[2]/tei:text/tei:body/tei:div/tei:div[@type='opener']"/></em>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:apply-templates select="//TEI[2]/tei:text/tei:body/tei:div/tei:div[@type='letter-body']"/>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:apply-templates select="/teiCorpus/TEI[2]/tei:text/tei:body/tei:div/tei:div[@type='closer']"/><br/>
                                                </xsl:element>
                                            </xsl:element>
                                            <!--div stampe su cartolina-->
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">text_retro2</xsl:attribute>
                                                <xsl:element name="div">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:attribute name="id">p_stampe</xsl:attribute>
                                                    <b>Stampe presenti sulla cartolina</b><br/>
                                                    <xsl:element name="p">
                                                        <xsl:attribute name="id"><xsl:value-of select="//tei:ab[@xml:id='ScritteR2']/tei:s[position()=1]/@xml:id"/></xsl:attribute>
                                                       <xsl:value-of select="/teiCorpus/TEI[2]/tei:text/tei:front/tei:div/tei:ab[@xml:id='ScritteR2']/tei:s[position()=1]"/><br/><br/>
                                                    </xsl:element>
                                                    <xsl:element name="p">
                                                        <xsl:attribute name="id"><xsl:value-of select="//tei:ab[@xml:id='ScritteR2']/tei:s[position()=2]/@xml:id"/></xsl:attribute>
                                                       ---<xsl:value-of select="/teiCorpus/TEI[2]/tei:text/tei:front/tei:div/tei:ab[@xml:id='ScritteR2']/tei:s[position()=2]"/>---
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:element>
                                            
                                        </xsl:if>
                                        
                                        <xsl:if test="@xml:id='retro3'">
                                            <!--div testo cartolina-->
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">text_retro1</xsl:attribute>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <em><xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:div[@type='opener']"/></em>
                                                </xsl:element>
                                                <xsl:element name="p">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:div[@type='letter-body']/tei:salute"/>
                                                    <xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:body/tei:div/tei:div[@type='letter-body']/tei:ab"/><br/>
                                                </xsl:element>
                                            </xsl:element>
                                            <!--div stampe su cartolina-->
                                            <xsl:element name="div">
                                                <xsl:attribute name="class">text_retro2</xsl:attribute>
                                                <xsl:element name="div">
                                                    <xsl:attribute name="class">p_retro</xsl:attribute>
                                                    <xsl:attribute name="id">p_stampe</xsl:attribute>
                                                    <b>Stampe presenti sulla cartolina</b><br/>
                                                    <xsl:element name="p">
                                                        <xsl:attribute name="id"><xsl:value-of select="//tei:div[@xml:id='ScritteR3']/tei:ab[position()=1]/tei:s/@xml:id"/></xsl:attribute>
                                                       <xsl:value-of select="/teiCorpus/TEI[3]/tei:text/tei:front/tei:div/tei:div[@xml:id='ScritteR3']/tei:ab[position()=1]"/><br/>
                                                    </xsl:element>
                                                    <xsl:element name="div">
                                                        <xsl:attribute name="id"><xsl:value-of select="//tei:div[@xml:id='ScritteR3']/tei:ab[position()=2]/@xml:id"/></xsl:attribute>
                                                        <xsl:apply-templates select="/teiCorpus/TEI[3]/tei:text/tei:front/tei:div/tei:div[@xml:id='ScritteR3']/tei:ab[position()=2]"/><br/>
                                                    </xsl:element>
                                                    <xsl:element name="p">
                                                        <xsl:attribute name="id"><xsl:value-of select="//tei:div[@xml:id='ScritteR3']/tei:ab[position()=3]/tei:hi/tei:s/@xml:id"/></xsl:attribute>
                                                        <xsl:value-of select="/teiCorpus/TEI[3]/tei:text/tei:front/tei:div/tei:div[@xml:id='ScritteR3']/tei:ab[position()=3]"/><br/>
                                                    </xsl:element>
                                 
                                                </xsl:element>
                                            </xsl:element>
                                            
                                        </xsl:if>
                                                
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:if>
               
               <!--INFO-->
               
               <xsl:element name="div">
                   <xsl:attribute name="class">divinfo</xsl:attribute>
                   <xsl:attribute name="id">info</xsl:attribute>

                   <div id="div_msdesc">
                       <h2>MSDESC</h2>
                       <xsl:if test="//TEI[@n='1']">
                           <h3>Cartolina 067</h3>
                           <xsl:apply-templates select="//TEI[@n='1']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc"/>
                       </xsl:if>
                       <xsl:if test="//TEI[@n='2']">
                           <h3>Cartolina 187</h3>
                           <xsl:apply-templates select="//TEI[@n='2']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc"/>  
                       </xsl:if>
                       <xsl:if test="//TEI[@n='3']">
                           <h3>Cartolina 197</h3>
                           <xsl:apply-templates select="//TEI[@n='3']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc"/> 
                       </xsl:if>
                   </div>
                   
                   <div id="div_persone">
                       <h2>PERSONE</h2>
                       <xsl:if test="//TEI[@n=1]">
                           <h3>Cartolina 067</h3>
                           <xsl:apply-templates select="//TEI[@n='1']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person"/>
                       </xsl:if>
                       <xsl:if test="//TEI[@n=2]">
                           <h3>Cartolina 187</h3>
                           <xsl:apply-templates select="//TEI[@n='2']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person"/>  
                       </xsl:if>
                       <xsl:if test="//TEI[@n=3]">
                           <h3>Cartolina 197</h3>
                           <xsl:apply-templates select="//TEI[@n='3']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person"/> 
                       </xsl:if>
                   </div>
                   
                   <div id="div_luoghi">
                       <h2>LUOGHI</h2>
                       <xsl:if test="//TEI[@n=1]">
                           <h3>Cartolina 067</h3>
                           <xsl:apply-templates select="//TEI[@n='1']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/>
                           <xsl:apply-templates select="//TEI[@n='1']/tei:teiHeader/tei:profileDesc/tei:correspDesc"/>
                       </xsl:if>
                       <xsl:if test="//TEI[@n=2]">
                           <h3>Cartolina 187</h3>
                           <xsl:apply-templates select="//TEI[@n='2']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/> 
                           <xsl:apply-templates select="//TEI[@n='2']/tei:teiHeader/tei:profileDesc/tei:correspDesc"/>
                       </xsl:if>
                       <xsl:if test="//TEI[@n=3]">
                           <h3>Cartolina 197</h3>
                           <xsl:apply-templates select="//TEI[@n='3']/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/> 
                           <xsl:apply-templates select="//TEI[@n='3']/tei:teiHeader/tei:profileDesc/tei:correspDesc"/>
                       </xsl:if>
                   </div>
               </xsl:element>
               
               <!-- GALLERIA -->
               
               <xsl:element name="div">
               <xsl:attribute name="id">boxGalleria</xsl:attribute>
               <div id="divImgGalleria">
                   <img src="#" alt="" id="foto"/>
               </div>
               <div id="pulsantiGalleria">
                   <input type="button" value="⇠" id="indietro"/> 
                   <input type="button" value="⇢" id="avanti"/>
               </div> 
               <p id="messaggio"></p>
           </xsl:element>
               
           </xsl:element> 
             
                <div id="edition">
                    <h3>Informazioni sull'edizione</h3>
                    <xsl:apply-templates select="/teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/>
                    <xsl:apply-templates select="/teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt"/>
                </div>
                
                <div id="publication">
                    <h3>Informazioni sulla pubblicazione</h3>
                    <xsl:apply-templates select="/teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
                </div>
                
                <div id="crediti">
                    <h3>Crediti</h3>
                    <p>Progetto realizzato per il corso di Codifica dei Testi, anno 2018/19.</p>
                </div>
               
            </body>
            
        </html>
    </xsl:template>
    
    <!--TEMPLATE PER RESPSTMT INIZIALE-->
    
    <xsl:template match="//tei:respStmt">
        <xsl:choose>
            <xsl:when test="count(tei:name)>1">   
                <xsl:value-of select="tei:resp"/>:
                <xsl:value-of select="tei:name[1]"/>,
                <xsl:value-of select="tei:name[2]"/><br/>
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:when test="tei:name[text()]">
                <xsl:value-of select="tei:resp"/>:
                <xsl:value-of select="tei:name"/><br/>
                
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!--TEMPLATE PER PUBLICATIONSTMT -->
    
    <xsl:template match="//tei:publicationStmt">
        <p>Publisher: <xsl:value-of select="//current()/tei:publisher"/>, <xsl:value-of select="//current()/tei:pubPlace"/></p>
        <p>Copyright: <xsl:value-of select="//current()/tei:availability"/></p>
        <p>Distributor: <xsl:value-of select="//current()/tei:address/tei:addrLine[1]"/></p>
    </xsl:template>
    
    <!--TEMPLATE PER MSDESC-->
    
    <xsl:template match="//tei:msIdentifier">
        <p><em>Collocazione: </em>
            <xsl:value-of select="current()/tei:country"/>, <xsl:value-of select="current()/tei:settlement"/>.</p>
        <p><em>Identificativo: </em><xsl:value-of select="current()/tei:idno"/></p>
    </xsl:template>
    
    <xsl:template match="//tei:msContents">
        <p><em>Contenuto: </em> 
            <xsl:value-of select="current()/tei:summary"/> in <xsl:value-of select="current()/tei:textLang"/>.</p>    
    </xsl:template>
    
    <xsl:template match="//tei:physDesc">
        <p><em>Caratteristiche: </em>
            <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:objectType"/> di <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:material"/>, 
            con dimensioni in cm <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height"/>
            x <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width"/>.</p>
        <p><em>Francobolli/timbri: </em>
            <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:stamp"/></p>
    </xsl:template>
    
    <!--TEMPLATE PER PERSONE-->
    
    <xsl:template match="//tei:person">
        <em><xsl:apply-templates select="//current()/tei:persName"/></em>: <xsl:value-of select="current()/tei:note"/>.<br/>   
    </xsl:template>
    <xsl:template match="//tei:surname[node()='Mastroianni']">
        <a href="https://www.guidedocartis.it/?page_id=15834"><xsl:value-of select="current()"/></a>
    </xsl:template>
    <xsl:template match="//tei:surname[node()='Santoro']">
        <a href="https://en.wikipedia.org/wiki/Rubens_Santoro"><xsl:value-of select="current()"/></a>
    </xsl:template>
    <xsl:template match="//tei:addName">
        (<xsl:value-of select="."/>)
    </xsl:template>
    
    <!--TEMPLATE PER LUOGHI-->
    
    <xsl:template match="//tei:place">
       <xsl:apply-templates />
        
    </xsl:template>
    <xsl:template match="//tei:placeName">
        <xsl:value-of select="current()"/> 
    </xsl:template>
    <xsl:template match="//tei:location">
        <xsl:if test="//current()/tei:district">
            (<xsl:value-of select="//current()/tei:district[@type='provincia']"/>), <xsl:value-of select="//current()/tei:region"/></xsl:if>,
        <xsl:value-of select="//current()/tei:country"/> <br/>
    </xsl:template>
    <xsl:template match="//tei:correspAction[@type='sent']">
        La cartolina è stata inviata da: <em><xsl:value-of select="//current()/tei:placeName"/></em>, il <xsl:value-of select="//current()/tei:date"/> <br/>
    </xsl:template>
    <xsl:template match="//tei:correspAction[@type='received']">
        <xsl:if test="//current()/tei:placeName">
       ed è giunta a: <em><xsl:value-of select="//current()/tei:placeName"/></em>, il <xsl:value-of select="//current()/tei:date"/>
    </xsl:if>
        <xsl:if test="not(//current()/tei:placeName)">
         <xsl:value-of select="//current()/tei:note"/>
        </xsl:if>
    </xsl:template>
    
    <!--TEMPLATE PER ANDARE A CAPO-->
    
    <xsl:template match="//tei:lb">
        <br/>
        <xsl:element name="span">
            <xsl:attribute name="class">line</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select='@xml:id'/></xsl:attribute>
            ➤
        </xsl:element>
    </xsl:template>
    
    <!--TEMPLATE PER POPUP-->
    
    <xsl:template match="//tei:date">
        <xsl:choose>
            <xsl:when test="@xml:id">
                <xsl:element name="span">
                    <xsl:attribute name="class">popup</xsl:attribute>
                    <xsl:attribute name="onmouseover">PopUp(<xsl:value-of select="//current()/@xml:id"/>)</xsl:attribute> 
                    <xsl:attribute name="onmouseout">NoPopUp(<xsl:value-of select="//current()/@xml:id"/>)</xsl:attribute> 
                    <xsl:value-of select="current()"/>
                    <xsl:element name="span">
                        <xsl:attribute name="class">popuptext</xsl:attribute>
                        <xsl:attribute name="id"><xsl:value-of select="current()/@xml:id"/></xsl:attribute><!--prendi id del lb così è univoco e va bene-->
                        Data: <xsl:value-of select="current()/@when"/>  
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="//tei:date">
                <xsl:value-of select="current()"/>
            </xsl:when>
        </xsl:choose>
     
    </xsl:template>
    
    <!--TEMPLATE PER AREE-->
    
    <xsl:template match="//tei:zone">
        <xsl:variable name="idZ" select="@xml:id"/>
        <!--Collegamento testo-immagine per lb-->
        <xsl:if test="//tei:lb/translate(@facs, '#', '')=$idZ">
            <xsl:element name="area">
                <xsl:attribute name="shape">rect</xsl:attribute>
                <xsl:attribute name="class">CursorePointer</xsl:attribute>
                <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute> 
                <xsl:attribute name="onmouseover">Highlight(<xsl:value-of select="//tei:lb[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute> 
                <xsl:attribute name="onmouseout">UnHighlight(<xsl:apply-templates select="//tei:lb[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute>
            </xsl:element> 
        </xsl:if>	
        <!--Collegamento testo-immagine per addrLine-->
        <xsl:if test="//tei:addrLine/translate(@facs, '#', '')=$idZ">
            <xsl:element name="area">
                <xsl:attribute name="shape">rect</xsl:attribute>
                <xsl:attribute name="class">CursorePointer</xsl:attribute>
                <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute> 
                <xsl:attribute name="onmouseover">Highlight(<xsl:value-of select="//tei:addrLine[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute> 
                <xsl:attribute name="onmouseout">UnHighlight(<xsl:apply-templates select="//tei:addrLine[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute>
            </xsl:element> 
        </xsl:if>
        <!--collegamento testo-immagine per s-->
        <xsl:if test="//tei:s/translate(@facs, '#', '')=$idZ">
            <xsl:element name="area">
                <xsl:attribute name="shape">rect</xsl:attribute>
                <xsl:attribute name="class">CursorePointer</xsl:attribute>
                <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute> 
                <xsl:attribute name="onmouseover">Highlight(<xsl:value-of select="//tei:s[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute> 
                <xsl:attribute name="onmouseout">UnHighlight(<xsl:value-of select="//tei:s[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute>
            </xsl:element> 
        </xsl:if>
        <!--collegamento testo-immagine per ab-->
        <xsl:if test="//tei:ab/translate(@facs, '#', '')=$idZ">
            <xsl:element name="area">
                <xsl:attribute name="shape">rect</xsl:attribute>
                <xsl:attribute name="class">CursorePointer</xsl:attribute>
                <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute> 
                <xsl:attribute name="onmouseover">Highlight(<xsl:value-of select="//tei:ab[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute> 
                <xsl:attribute name="onmouseout">UnHighlight(<xsl:value-of select="//tei:ab[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute>
            </xsl:element> 
        </xsl:if>
        <!--Collegamento testo-immagine per stamp-->
        <xsl:if test="//tei:mentioned/translate(@facs, '#', '')=$idZ">
            <xsl:element name="area">
                <xsl:attribute name="shape">rect</xsl:attribute>
                <xsl:attribute name="class">CursorePointer</xsl:attribute>
                <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute> 
                <xsl:attribute name="onmouseover">Highlight(<xsl:value-of select="//tei:mentioned[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute> 
                <xsl:attribute name="onmouseout">UnHighlight(<xsl:value-of select="//tei:mentioned[translate(@facs, '#', '')=$idZ]/@xml:id"/>)</xsl:attribute>
            </xsl:element> 
        </xsl:if>
        
    </xsl:template>

    <!--TEMPLATE PER CHOICE-->
    <xsl:template match="//tei:choice">
        <xsl:if test="//tei:orig">
            <xsl:element name="span">
                <xsl:attribute name="class">popup2</xsl:attribute>
                <xsl:attribute name="onmouseover">PopUp(<xsl:value-of select="//current()//tei:orig/@xml:id"/>)</xsl:attribute> 
                <xsl:attribute name="onmouseout">NoPopUp(<xsl:value-of select="//current()//tei:orig/@xml:id"/>)</xsl:attribute> 
                <xsl:value-of select="current()//tei:orig"/>
                <xsl:element name="span">
                    <xsl:attribute name="class">popuptext2</xsl:attribute>
                    <xsl:attribute name="id"><xsl:value-of select="current()//tei:orig/@xml:id"/></xsl:attribute><!--prendi id del lb così è univoco e va bene-->
                    Al giorno d'oggi usiamo "il" al posto di "li" che ormai è una forma arcaica  
                </xsl:element>
            </xsl:element>
        </xsl:if>
        <xsl:if test="//tei:expan">
            <xsl:value-of select="//current()/tei:expan"/>
        </xsl:if>
    </xsl:template>
  <!--TEMPLATE PER LE STAMPE NELLA CARTOLINA 197-->
    <xsl:template match="//tei:div[@xml:id='ScritteR3']/tei:ab[position()=2]/tei:s">
       <p id="ScritteR3"><xsl:value-of select="current()"/></p>
    </xsl:template>
    <xsl:template match="//tei:gap">
    --(<xsl:value-of select="."/>)--
    </xsl:template>
</xsl:stylesheet>
