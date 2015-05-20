<?xml version="1.0" encoding="UTF-8"?>
<!--
        Do not edit this file directly!
        This file is generated automatically by processing 
        info-model.ditamap
        If you want to change the rules, edit the corresponding sections 
        marked with audience="rules" in the corresponding topic files.
      -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  queryBinding="xslt2">
   <sch:include href="library.sch#avoidWordInElement"/>
   <sch:include href="library.sch#avoidEndFragment"/>
   <sch:include href="library.sch#avoidAttributeInElement"/>
   <sch:include href="library.sch#recommendElementInParent"/>
   <sch:include href="library.sch#restrictWords"/>
   <!--Generated from topics/indexEntries.dita-->
   <sch:pattern is-a="avoidWordInElement">
      <sch:param name="word" value="oXygen"/>
      <sch:param name="element" value="indexterm"/>
      <sch:param name="message" value="We should avoid using oXygen inside index terms!"/>
   </sch:pattern>
   <!--Generated from topics/images.dita-->
   <sch:pattern is-a="avoidAttributeInElement">
      <sch:param name="element" value="image"/>
      <sch:param name="attribute" value="scale"/>
      <sch:param name="message"
             value="Dynamically scaled images are not properly displayed, you&#xA;            should scale the image with an image tool and keep it within&#xA;            the recommended with and height limits."/>
   </sch:pattern>
   <!--Generated from topics/lists.dita-->
   <sch:pattern is-a="avoidEndFragment">
      <sch:param name="fragment" value=";"/>
      <sch:param name="element" value="li"/>
      <sch:param name="message"
             value="List items should not end with a semi-column (;). If it is&#xA;            a sentence then end it with a full stop (.), otherwise leave&#xA;            it without an ending character."/>
   </sch:pattern>
  
  <!-- Check the the indexterm exist. -->
  <sch:pattern>
    <sch:rule context="/*">
      <sch:assert test="prolog/metadata/keywords/indexterm" role="warn" sqf:fix="addFragment">
        It is recommended to add an 'indexterm' in the current '<sch:name/>' element.
      </sch:assert>
      
      <sqf:fix id="addFragment">
        <sqf:description>
          <sqf:title>Add the 'indexterm' element</sqf:title>
        </sqf:description>
        
        <!-- Add the indexterm element element and its parents -->
        <sqf:add match="(title | titlealts | abstract | shortdesc)[last()]" position="after" use-when="not(prolog)">
          <xsl:text>
          </xsl:text><prolog><xsl:text>
            </xsl:text><metadata><xsl:text>
              </xsl:text><keywords><xsl:text>
                 </xsl:text><indexterm><xsl:text> </xsl:text> </indexterm><xsl:text>
              </xsl:text></keywords><xsl:text>
            </xsl:text></metadata><xsl:text>
          </xsl:text></prolog>
        </sqf:add>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
  <!-- Topic ID must be equal to file name -->
  <sch:pattern>
    <sch:rule context="/*[1][contains(@class, ' topic/topic ')]">
      <sch:let name="reqId" value="replace(tokenize(document-uri(/), '/')[last()], '.dita', '')"/>
      <sch:assert test="@id = $reqId" sqf:fix="setId">
        Topic ID must be equal to file name.
      </sch:assert>
      <sqf:fix id="setId">
        <sqf:description>
          <sqf:title>Set "<sch:value-of select="$reqId"/>" as a topic ID</sqf:title>
          <sqf:p>The topic ID must be equal to the file name.</sqf:p>
        </sqf:description>
        <sqf:replace match="@id" node-type="attribute" target="id" select="$reqId"/>
      </sqf:fix>
    </sch:rule>
  </sch:pattern>
</sch:schema>
