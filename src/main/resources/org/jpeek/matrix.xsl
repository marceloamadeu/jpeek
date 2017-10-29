<?xml version="1.0"?>
<!--
The MIT License (MIT)

Copyright (c) 2017 Yegor Bugayenko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="2.0">
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="description" content="jpeek metrics"/>
        <meta name="keywords" content="code quality metrics"/>
        <meta name="author" content="jpeek.org"/>
        <link rel="shortcut icon" href="http://www.jpeek.org/logo.png"/>
        <link rel="stylesheet" href="http://cdn.rawgit.com/yegor256/tacit/gh-pages/tacit-css-1.1.1.min.css"/>
        <style type="text/css">
          body {
            padding: 1em;
          }
          td {
            padding-top: 0.25em;
            padding-bottom: 0.25em;
          }
        </style>
        <title>
          <xsl:text>matrix</xsl:text>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="matrix"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="matrix">
    <p>
      <a href="http://www.jpeek.org">
        <img alt="logo" src="http://www.jpeek.org/logo.svg" style="height:60px"/>
      </a>
    </p>
    <xsl:apply-templates select="classes"/>
  </xsl:template>
  <xsl:template match="classes">
    <p>
      <xsl:text>There are </xsl:text>
      <xsl:value-of select="count(class)"/>
      <xsl:text> classes:</xsl:text>
    </p>
    <table>
      <thead>
        <tr>
          <th>
            <xsl:text>Class</xsl:text>
          </th>
          <xsl:for-each select="class[1]/metric">
            <th>
              <a href="{@name}.xml">
                <xsl:value-of select="@name"/>
              </a>
            </th>
          </xsl:for-each>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="class">
          <xsl:sort select="@id" order="ascending" data-type="text"/>
        </xsl:apply-templates>
      </tbody>
    </table>
  </xsl:template>
  <xsl:template match="class">
    <tr>
      <td>
        <code>
          <xsl:value-of select="@id"/>
        </code>
      </td>
      <xsl:apply-templates select="metric">
        <xsl:sort select="@name" order="ascending" data-type="text"/>
      </xsl:apply-templates>
    </tr>
  </xsl:template>
  <xsl:template match="metric">
    <td>
      <xsl:attribute name="style">
        <xsl:text>background-color:</xsl:text>
        <xsl:choose>
          <xsl:when test="@color='red'">
            <xsl:text>red</xsl:text>
          </xsl:when>
          <xsl:when test="@color='green'">
            <xsl:text>green</xsl:text>
          </xsl:when>
          <xsl:when test="@color='yellow'">
            <xsl:text>orange</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>inherit</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text>;</xsl:text>
      </xsl:attribute>
      <xsl:text>&#xA0;</xsl:text>
    </td>
  </xsl:template>
</xsl:stylesheet>
