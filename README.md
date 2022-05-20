# Flutter Data View Idea

This concept for a Data View is a unique way to show tabular data with fixed headers and fixed row headers, with scrollable data under each row header.

It just uses a couple of nested Stack's with a couple of nested SingleChildScrollView's, along with a couple of layered widgets with some specific positioning and height settings (all customizable).

The SingleChildScrollView's handle the vertical and horizontal scrolling for the data and they are layered over a positioned Container with a Column that displays each row header.

Layered on top of that is a Container with a Row for the headers.

There are a couple of ScrollController's as well, to keep the horizontal scroll for the data and headers in sync.

![Alt Text](https://mediasrc.com/datatable_idea/data_view_idea.gif)
