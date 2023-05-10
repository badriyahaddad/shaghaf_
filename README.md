# shaghaf

![Shagaf]([https://raw.githubusercontent.com/Art-Institute-of-Chicago/template/master/aic-logo.gif](https://firebasestorage.googleapis.com/v0/b/passion-9985b.appspot.com/o/artwork_images%2Fandroid_icon.png?alt=media&token=49733d08-f178-495b-8168-abed11658a6c))

# Shaghaf Official Mobile App
> An app for all artists and art enthusiasts.


## Table of Contents

1. [Features](#features)
	1. [Home](#home)
	1. [Purchasing Products](#Purchasing_Products)
	1. [Asking for Services](#Asking_for_Services)
	1. [Posting art-work](#Posting_art-work)
	1. [Search](#search)
	1. [Profile](#Profile)
1. [Get the app](#get the app)
1. [Getting Started](#getting-started)
1. [Installation](#installation)
1. [Data sources](#Data-sources)
    1. Firebase: FireStore
    2. Firebase: Storage
1. [Contacts](#contacts)

## Features

This app is split into four distinct sections. In the future, additional sections might be added as we improve our infrastructure.

<table>
  <tr>
    <td><img src="Documentation/home.png" alt="Home Image"/></td>
    <td valign="top">
      <h3>Home</h3>
      <p>Provides a summary of current tours/exhibits/events at the museum.</p>
    </td>
  </tr>
  <tr>
    <td><img src="Documentation/audioGuide.png" alt="Audio Guide Image"/></td>
    <td valign="top">
      <h3>Audio Guide</h3>
      <p>Allows users to type in numbers found in the physical space of the museum next to artworks, which pulls up the corresponding audio content and information.</p>
    </td>
  </tr>
  <tr>
    <td><img src="Documentation/map.png" alt="Map Image"/></td>
    <td valign="top">
      <h3>Map</h3>
      <p>The map has a number of information points (annotations) enabled at various zoom levels. These include:</p>
      <ul>
        <li>Departments</li>
        <li>Amenities (bathrooms, elevators, etc.)</li>
        <li>Galleries</li>
        <li>Artworks</li>
      </ul>
      <p>The map uses CoreLocation to locate and orient the user when they are on-location in the museum.</p>
    </td>
  </tr>
  <tr>
    <td><img src="Documentation/tours.png" alt="Tours Image"/></td>
    <td valign="top">
      <h3>Tours</h3>
      <p>Provides custom tours with unique audio content that work in tandem with the map and guide users on a narrated journey.</p>
    </td>
  </tr>
  <tr>
    <td><img src="Documentation/search.png" alt="Search Image"/></td>
    <td valign="top">
      <h3>Search</h3>
      <p>Provides the ability to search for artworks, tours and exhibitions currently on display at the museum. Using the search, users are also able to find the location on the map of artworks as well as gift shops, restrooms, dining locations and the member lounge.</p>
    </td>
  </tr>
  <tr>
    <td><img src="Documentation/info.png" alt="Information Image"/></td>
    <td valign="top">
      <h3>Information</h3>
      <p>This section includes:</p>
      <ul>
        <li>Museum Information: basic museum info: hours, holidays, etc.</li>
        <li>Language Settings: allowing you to switch the language of the app to English, Spanish or Chinese.</li>
        <li>Location Settings: allowing you to modify your preference for tracking your location in the museum.</li>
      </ul>
    </td>
  </tr>
</table>


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
